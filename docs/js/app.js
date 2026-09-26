/* SPA router ?page=hinh-cau — chay duoc tren GitHub Pages (tinh, khong server). */
const UNIT_TXT = { L: 'đơn vị dài', S: 'đơn vị diện tích', V: 'đơn vị thể tích', deg: '°' };
function qs() { return new URLSearchParams(window.location.search); }
function page() { const p = (qs().get('page') || 'home').trim(); return (p === 'home' || SHAPE_DATA[p] || p === 'cong-thuc-nang-cao') ? p : 'home'; }
function typeset() {
  if (window.MathJax && MathJax.typesetPromise) { MathJax.typesetPromise().catch(() => {}); }
  else setTimeout(typeset, 300);
}
function esc(s) { return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;'); }

function filledMap(form) {
  const m = {};
  form.querySelectorAll('input[name]').forEach(i => {
    const x = parseFloat(String(i.value).replace(',', '.'));
    if (i.value.trim() !== '' && !isNaN(x) && x > 0) m[i.name.toLowerCase()] = x;
  });
  return m;
}
function liveUpdate(scope) {
  const form = scope.querySelector('form.calc-form');
  if (!form) return;
  const filled = filledMap(form);
  scope.querySelectorAll('.var-token').forEach(el => el.classList.remove('var-known', 'var-target'));
  scope.querySelectorAll('.formula-box li').forEach(el => el.classList.remove('formula-ready'));
  Object.keys(filled).forEach(k => {
    scope.querySelectorAll('.var-token[data-var]').forEach(el => {
      if (el.getAttribute('data-var').toLowerCase() === k) el.classList.add('var-known');
    });
  });
  scope.querySelectorAll('#formulaList li[data-inputs], .formula-box li[data-inputs]').forEach(li => {
    const need = li.getAttribute('data-inputs').split(',').map(s => s.trim().toLowerCase());
    if (need.length && need.every(k => filled[k] !== undefined)) {
      li.classList.add('formula-ready');
      li.querySelectorAll('.var-token[data-var]').forEach(el => {
        if (filled[el.getAttribute('data-var').toLowerCase()] === undefined) el.classList.add('var-target');
      });
    }
  });
  // SVG labels: svgLabelX -> input x
  scope.querySelectorAll('svg text[id^="svgLabel"]').forEach(t => {
    const key = t.id.replace(/^svgLabel/, '');
    const name = key.charAt(0).toLowerCase() + key.slice(1);
    const inp = form.querySelector('input[name="' + name + '"], input[name="' + name.toLowerCase() + '"]');
    const def = t.getAttribute('data-def') || t.textContent;
    if (!t.getAttribute('data-def')) t.setAttribute('data-def', def);
    if (inp && inp.value.trim() !== '' && !isNaN(parseFloat(inp.value))) t.textContent = name + ' = ' + inp.value.trim();
    else t.textContent = t.getAttribute('data-def');
  });
}

function renderShape(p) {
  const d = SHAPE_DATA[p];
  const params = qs();
  const inputsHtml = d.inputs.map(i => (
    '<div class="form-row"><label>' + i.label + '</label>' +
    '<input type="number" id="' + (i.id || ('in_' + i.name)) + '" step="any" name="' + i.name + '"' +
    (i.req ? ' required' : '') + ' value="' + esc(params.get(i.name) || '') + '" placeholder="' + esc(i.ph || '') + '"></div>'
  )).join('');
  return '' +
    '<div class="container"><h1>' + esc(d.title) + '</h1>' +
    (d.desc ? '<p class="page-desc">' + d.desc + '</p>' : '') +
    '<div class="calc-grid"><div class="calc-col-left">' +
    '<div class="svg-wrap">' + d.svg + '</div>' +
    '<div class="formula-box">' + d.formulas + '</div>' +
    '</div><div class="calc-col-right">' +
    '<div id="errBox" style="display:none;color:#b91c1c;margin-bottom:15px;padding:12px;background:#fee2e2;border-radius:6px;border:1px solid #f87171;"></div>' +
    '<form class="calc-form" id="calcForm" method="get" action="?">' +
    '<input type="hidden" name="page" value="' + p + '">' + inputsHtml +
    '<div class="form-actions"><button type="submit" class="btn-calc">Tính toán</button> ' +
    '<a class="btn-reset" href="?page=' + p + '">Làm mới</a></div></form>' +
    '<div id="resBox"></div>' +
    '<a href="?page=home" class="btn-home-bottom">Về trang chủ</a>' +
    '</div></div></div>';
}

function renderSteps(steps) {
  return '<div class="result-box"><h2>Kết quả & Các bước giải chi tiết</h2>' + steps.map(s => {
    const valHtml = (s.val === null || s.val === undefined)
      ? ''
      : ' <strong>' + fmt(s.val) + '</strong>' + (s.u && UNIT_TXT[s.u] ? ' <span class="unit-text">' + UNIT_TXT[s.u] + '</span>' : '');
    return '<div class="step-detail"><p><strong>' + s.t + '</strong></p><p>' + s.latex + valHtml + '</p></div>';
  }).join('') + '</div>';
}

function showError(msg) {
  const e = document.getElementById('errBox');
  e.style.display = 'block';
  e.innerHTML = '<strong>Lỗi:</strong> ' + esc(msg);
  document.getElementById('resBox').innerHTML = '';
}

function bindShape(p) {
  const form = document.getElementById('calcForm');
  const scope = document.getElementById('view');
  const upd = () => liveUpdate(scope);
  form.querySelectorAll('input[name]').forEach(i => i.addEventListener('input', upd));
  upd();
  form.addEventListener('submit', ev => {
    ev.preventDefault();
    const v = {};
    form.querySelectorAll('input[name]').forEach(i => { v[i.name] = i.value; });
    const calc = CALCS[p];
    if (!calc) return;
    const out = calc.run(v);
    if (out.err) { showError(out.err); typeset(); return; }
    document.getElementById('errBox').style.display = 'none';
    document.getElementById('resBox').innerHTML = renderSteps(out.R.steps);
    const q = new URLSearchParams({ page: p });
    Object.keys(v).forEach(k => { if (String(v[k]).trim() !== '') q.set(k, String(v[k]).trim()); });
    window.history.replaceState(null, '', '?' + q.toString());
    typeset();
  });
  // auto-run neu URL co san input
  const params = qs();
  let hasInput = false;
  form.querySelectorAll('input[name]').forEach(i => { if (params.get(i.name)) hasInput = true; });
  if (hasInput) form.dispatchEvent(new Event('submit'));
}

function render() {
  const p = page();
  const view = document.getElementById('view');
  document.title = p === 'home' ? 'Tính Toán Hình Học - Giải Chi Tiết 2D & 3D Chuẩn SGK - THPT'
    : p === 'cong-thuc-nang-cao' ? 'Công Thức Nâng Cao - Oxyz, Mặt Cầu Ngoại Tiếp & Tỉ Số Thể Tích'
    : ((SHAPE_DATA[p] ? SHAPE_DATA[p].title + ' - Công Thức, Tính Toán & Lời Giải Chi Tiết' : 'Tính Toán Hình Học'));
  if (p === 'home') { view.innerHTML = HOME_HTML; }
  else if (p === 'cong-thuc-nang-cao') { view.innerHTML = ADV_HTML; }
  else { view.innerHTML = renderShape(p); bindShape(p); }
  typeset();
  window.scrollTo(0, 0);
}
window.addEventListener('DOMContentLoaded', render);
window.addEventListener('popstate', render);
document.addEventListener('click', ev => {
  const a = ev.target.closest('a[href^="?page="]');
  if (!a) return;
  ev.preventDefault();
  window.history.pushState(null, '', a.getAttribute('href'));
  render();
});
