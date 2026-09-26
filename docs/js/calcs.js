/* Port logic model Java -> JS. R: object ket qua (ten thuoc tinh giong getter Java bo get/is, viet thuong chu dau). */
const PI = Math.PI;
const SQ = (x) => x * x;
function fmt(x) {
  if (x === null || x === undefined || isNaN(x)) return '';
  const r = Number(x.toFixed(4));
  return r.toLocaleString('en-US', { maximumFractionDigits: 4 });
}
function num(raw) {
  if (raw === null || raw === undefined) return NaN;
  const s = String(raw).trim().replace(',', '.');
  if (s === '') return NaN;
  return Number(s);
}
function reqNum(v, obj, key) { // bat buoc > 0 ; tra {val} hoac {err}
  const x = num(obj[key]);
  if (isNaN(x)) return { err: 'num' };
  if (x <= 0) return { err: 'pos' };
  return { val: x };
}
const ERR_NUM = 'Vui lòng nhập số hợp lệ.';
const ERR_POS = 'Vui lòng nhập các kích thước lớn hơn 0 và hợp lệ.';
function reqAll(v, keys) {
  const o = {};
  for (const k of keys) {
    const r = reqNum(0, v, k);
    if (r.err === 'num') return { err: ERR_NUM };
    if (r.err === 'pos') return { err: ERR_POS };
    o[k] = r.val;
  }
  return { vals: o };
}
function optNum(v, key) {
  const x = num(v[key]);
  return isNaN(x) || x <= 0 ? null : x;
}
function optAngle(v, key) {
  const x = num(v[key]);
  return isNaN(x) || x <= 0 || x >= 180 ? null : x;
}
const RAW = String.raw;

const CALCS = {
  /* ---------- hinh-vuong ---------- */
  'hinh-vuong': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a;
      const R = { a, perimeter: 4 * a, area: a * a, diagonal: a * Math.SQRT2, circumradius: a * Math.SQRT2 / 2, inradius: a / 2 };
      R.steps = [
        { t: '1. Chu vi (C):', latex: RAW`\(C = 4a = 4(${a}) = \)`, val: R.perimeter, u: 'L' },
        { t: '2. Diện tích (S):', latex: RAW`\(S = a^2 = (${a})^2 = \)`, val: R.area, u: 'S' },
        { t: '3. Đường chéo (d):', latex: RAW`\(d = a\sqrt{2} = (${a})\sqrt{2} \approx \)`, val: R.diagonal, u: 'L' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{d}{2} = \dfrac{${a}\sqrt{2}}{2} \approx \)`, val: R.circumradius, u: 'L' },
        { t: '5. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{a}{2} = \dfrac{${a}}{2} = \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-chu-nhat (s=rong, l=dai) ---------- */
  'hinh-chu-nhat': {
    run(v) {
      const r = reqAll(v, ['s', 'l']); if (r.err) return r;
      const { s, l } = r.vals;
      const d = Math.sqrt(s * s + l * l);
      const R = { s, l, area: s * l, perimeter: 2 * (s + l), diagonal: d, circumradius: d / 2 };
      R.steps = [
        { t: '1. Diện tích (S):', latex: RAW`\(S = s \times l = (${s})(${l}) = \)`, val: R.area, u: 'S' },
        { t: '2. Chu vi (C):', latex: RAW`\(C = 2(s + l) = 2(${s} + ${l}) = \)`, val: R.perimeter, u: 'L' },
        { t: '3. Đường chéo (d):', latex: RAW`\(d = \sqrt{s^2 + l^2} = \sqrt{(${s})^2 + (${l})^2} \approx \)`, val: R.diagonal, u: 'L' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{d}{2} \approx \)`, val: R.circumradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-tron ---------- */
  'hinh-tron': {
    run(v) {
      const r = reqAll(v, ['r']); if (r.err) return r;
      const x = r.vals.r;
      const R = { r: x, perimeter: 2 * PI * x, area: PI * x * x, diameter: 2 * x };
      R.steps = [
        { t: '1. Chu vi (C):', latex: RAW`\(C = 2\pi r = 2\pi(${x}) \approx \)`, val: R.perimeter, u: 'L' },
        { t: '2. Diện tích (S):', latex: RAW`\(S = \pi r^2 = \pi(${x})^2 \approx \)`, val: R.area, u: 'S' },
        { t: '3. Đường kính (d):', latex: RAW`\(d = 2r = 2(${x}) = \)`, val: R.diameter, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-tam-giac ---------- */
  'hinh-tam-giac': {
    run(v) {
      const r = reqAll(v, ['a', 'b', 'c', 'h']); if (r.err) return r;
      const { a, b, c, h } = r.vals;
      if (a + b <= c || a + c <= b || b + c <= a) return { err: ERR_POS };
      const P = a + b + c, p = P / 2;
      const heron = Math.sqrt(p * (p - a) * (p - b) * (p - c));
      const R = { a, b, c, h, perimeter: P, area: 0.5 * a * h, areaHeron: heron, circumradius: a * b * c / (4 * heron), inradius: heron / p };
      R.steps = [
        { t: '1. Chu vi (C):', latex: RAW`\(C = a + b + c = ${a} + ${b} + ${c} = \)`, val: R.perimeter, u: 'L' },
        { t: '2. Diện tích (S):', latex: RAW`\(S = \dfrac{1}{2}ah = \dfrac{1}{2}(${a})(${h}) = \)`, val: R.area, u: 'S' },
        { t: '3. Diện tích Heron:', latex: RAW`\(S = \sqrt{p(p-a)(p-b)(p-c)} \approx \)`, val: R.areaHeron, u: 'S' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{abc}{4S} \approx \)`, val: R.circumradius, u: 'L' },
        { t: '5. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{S}{p} \approx \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- tam-giac-deu ---------- */
  'tam-giac-deu': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a, s3 = Math.sqrt(3);
      const R = { a, perimeter: 3 * a, area: a * a * s3 / 4, height: a * s3 / 2, circumradius: a * s3 / 3, inradius: a * s3 / 6 };
      R.steps = [
        { t: '1. Chu vi (C):', latex: RAW`\(C = 3a = 3(${a}) = \)`, val: R.perimeter, u: 'L' },
        { t: '2. Diện tích (S):', latex: RAW`\(S = \dfrac{a^2\sqrt{3}}{4} = \dfrac{(${a})^2\sqrt{3}}{4} \approx \)`, val: R.area, u: 'S' },
        { t: '3. Đường cao (h):', latex: RAW`\(h = \dfrac{a\sqrt{3}}{2} \approx \)`, val: R.height, u: 'L' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{a\sqrt{3}}{3} \approx \)`, val: R.circumradius, u: 'L' },
        { t: '5. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{a\sqrt{3}}{6} \approx \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- tam-giac-vuong ---------- */
  'tam-giac-vuong': {
    run(v) {
      const r = reqAll(v, ['c1', 'c2']); if (r.err) return r;
      const { c1, c2 } = r.vals;
      const hyp = Math.sqrt(c1 * c1 + c2 * c2);
      const R = { c1, c2, hypotenuse: hyp, perimeter: c1 + c2 + hyp, area: 0.5 * c1 * c2, altitude: c1 * c2 / hyp, circumradius: hyp / 2, inradius: (c1 + c2 - hyp) / 2 };
      R.steps = [
        { t: '1. Cạnh huyền:', latex: RAW`\(c = \sqrt{c_1^2 + c_2^2} = \sqrt{(${c1})^2 + (${c2})^2} \approx \)`, val: R.hypotenuse, u: 'L' },
        { t: '2. Chu vi (C):', latex: RAW`\(C = c_1 + c_2 + c \approx \)`, val: R.perimeter, u: 'L' },
        { t: '3. Diện tích (S):', latex: RAW`\(S = \dfrac{1}{2}c_1c_2 = \)`, val: R.area, u: 'S' },
        { t: '4. Đường cao từ đỉnh vuông:', latex: RAW`\(h = \dfrac{c_1c_2}{c} \approx \)`, val: R.altitude, u: 'L' },
        { t: '5. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{c}{2} \approx \)`, val: R.circumradius, u: 'L' },
        { t: '6. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{c_1 + c_2 - c}{2} \approx \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-thang ---------- */
  'hinh-thang': {
    run(v) {
      const r = reqAll(v, ['a', 'b', 'h']); if (r.err) return r;
      const { a, b, h } = r.vals;
      const R = { a, b, h, area: (a + b) * h / 2, median: (a + b) / 2 };
      R.steps = [
        { t: '1. Diện tích (S):', latex: RAW`\(S = \dfrac{(a+b)h}{2} = \dfrac{(${a}+${b})${h}}{2} = \)`, val: R.area, u: 'S' },
        { t: '2. Đường trung bình (m):', latex: RAW`\(m = \dfrac{a+b}{2} = \)`, val: R.median, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-binh-hanh ---------- */
  'hinh-binh-hanh': {
    run(v) {
      const a = optNum(v, 'a'), b = optNum(v, 'b'), h0 = optNum(v, 'h'), al0 = optAngle(v, 'alpha');
      const ok = (a !== null && b !== null) || (a !== null && h0 !== null) ||
        (b !== null && al0 !== null) || (h0 !== null && al0 !== null) || (h0 !== null && b !== null);
      if (!ok) return { err: 'Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức. Ví dụ: chỉ cần (a, h) hoặc (a, b) hoặc (b, α) hoặc (h, α) hoặc (h, b).' };
      let h = h0, bb = b, al = al0;
      let dH = false, dB = false, dA = false;
      if (h === null && bb !== null && al !== null) { h = bb * Math.sin(al * PI / 180); dH = true; }
      if (bb === null && h !== null && al !== null) { const s = Math.sin(al * PI / 180); if (s > 0.001) { bb = h / s; dB = true; } }
      if (al === null && h !== null && bb !== null && h <= bb) { al = Math.asin(h / bb) * 180 / PI; dA = true; }
      const R = { a, b: bb, h, alpha: al, deducedH: dH, deducedB: dB, deducedAlpha: dA };
      R.perimeter = (a !== null && bb !== null) ? 2 * (a + bb) : null;
      R.areaByHeight = (a !== null && h !== null) ? a * h : null;
      R.areaByAngle = (a !== null && bb !== null && al !== null) ? a * bb * Math.sin(al * PI / 180) : null;
      if (R.perimeter === null && R.areaByHeight === null && R.areaByAngle === null)
        return { err: 'Không thể tính toán từ các dữ kiện đã nhập. Vui lòng kiểm tra lại.' };
      const st = [];
      if (dH) st.push({ t: '✨ Suy luận chiều cao h từ cạnh bên b và góc α:', latex: RAW`\(h = b \times \sin\alpha = ${fmt(bb)} \times \sin(${fmt(al)}°) = \)`, val: h, u: 'L' });
      if (dB) st.push({ t: '✨ Suy luận cạnh bên b từ chiều cao h và góc α:', latex: RAW`\(b = \dfrac{h}{\sin\alpha} \approx \)`, val: bb, u: 'L' });
      if (dA) st.push({ t: '✨ Suy luận góc α từ chiều cao h và cạnh bên b:', latex: RAW`\(\alpha = \arcsin\!\left(\dfrac{h}{b}\right) \approx \)`, val: al, u: 'deg' });
      if (R.perimeter !== null) st.push({ t: '1. Chu vi hình bình hành (C):', latex: RAW`\(C = 2(a+b) = \)`, val: R.perimeter, u: 'L' });
      if (R.areaByHeight !== null) st.push({ t: '2. Diện tích theo chiều cao (S = a·h):', latex: RAW`\(S = a \times h = \)`, val: R.areaByHeight, u: 'S' });
      if (R.areaByAngle !== null) st.push({ t: '3. Diện tích theo 2 cạnh & góc (S = a·b·sinα):', latex: RAW`\(S = a \times b \times \sin\alpha \approx \)`, val: R.areaByAngle, u: 'S' });
      R.steps = st;
      return { R };
    }
  },
  /* ---------- hinh-thoi ---------- */
  'hinh-thoi': {
    run(v) {
      let a = optNum(v, 'a'), d1 = optNum(v, 'd1'), d2 = optNum(v, 'd2');
      let al = optNum(v, 'alpha'); if (al !== null && al >= 180) al = null;
      const ok = (d1 !== null && d2 !== null) || (a !== null && al !== null) ||
        (a !== null && (d1 !== null || d2 !== null)) || (a !== null);
      if (!ok) return { err: 'Vui lòng nhập đủ dữ kiện cho ít nhất 1 công thức (ví dụ: chỉ cần 2 đường chéo d1, d2; hoặc cạnh a và góc α; hoặc cạnh a và 1 đường chéo).' };
      if (a !== null && d1 !== null && d1 >= 2 * a) return { err: 'Độ dài đường chéo d1 phải nhỏ hơn 2 lần cạnh a (d1 < 2a) để tạo thành hình thoi hợp lệ.' };
      if (a !== null && d2 !== null && d2 >= 2 * a) return { err: 'Độ dài đường chéo d2 phải nhỏ hơn 2 lần cạnh a (d2 < 2a) để tạo thành hình thoi hợp lệ.' };
      const R = { a, d1, d2, alpha: al, mode: 'UNKNOWN', deducedA: false, deducedD1: false, deducedD2: false, deducedAlpha: false, hasArea: false, hasInradius: false, perimeter: 0, area: 0, inradius: 0 };
      const clampSin = (x) => Math.min(1, x);
      if (d1 > 0 && d2 > 0) {
        R.area = 0.5 * d1 * d2; R.hasArea = true; R.mode = 'DIAGONALS';
        if (!(a > 0)) { R.a = Math.sqrt(SQ(d1 / 2) + SQ(d2 / 2)); R.deducedA = true; a = R.a; }
        R.perimeter = 4 * R.a; R.inradius = d1 * d2 / (4 * R.a); R.hasInradius = true;
        if (!(al > 0)) { R.alpha = Math.asin(clampSin(R.area / (R.a * R.a))) * 180 / PI; R.deducedAlpha = true; }
      } else if (a > 0 && al > 0) {
        R.perimeter = 4 * a; R.area = a * a * Math.sin(al * PI / 180); R.hasArea = true; R.mode = 'SIDE_ANGLE';
      } else if (a > 0 && d1 > 0 && d1 < 2 * a) {
        R.perimeter = 4 * a; R.d2 = 2 * Math.sqrt(a * a - SQ(d1 / 2)); R.deducedD2 = true;
        R.area = 0.5 * d1 * R.d2; R.hasArea = true; R.inradius = d1 * R.d2 / (4 * a); R.hasInradius = true;
        R.alpha = Math.asin(clampSin(R.area / (a * a))) * 180 / PI; R.deducedAlpha = true; R.mode = 'SIDE_DIAG1';
      } else if (a > 0 && d2 > 0 && d2 < 2 * a) {
        R.perimeter = 4 * a; R.d1 = 2 * Math.sqrt(a * a - SQ(d2 / 2)); R.deducedD1 = true;
        R.area = 0.5 * R.d1 * d2; R.hasArea = true; R.inradius = R.d1 * d2 / (4 * a); R.hasInradius = true;
        R.alpha = Math.asin(clampSin(R.area / (a * a))) * 180 / PI; R.deducedAlpha = true; R.mode = 'SIDE_DIAG2';
      } else if (a > 0) { R.perimeter = 4 * a; R.mode = 'SIDE_ONLY'; }
      const st = [];
      if (R.deducedA) st.push({ t: '✨ Suy luận cạnh a (Pytago):', latex: RAW`\(a = \sqrt{(d_1/2)^2 + (d_2/2)^2} \approx \)`, val: R.a, u: 'L' });
      if (R.deducedD2) st.push({ t: '✨ Suy luận d₂:', latex: RAW`\(d_2 = 2\sqrt{a^2 - (d_1/2)^2} \approx \)`, val: R.d2, u: 'L' });
      if (R.deducedD1) st.push({ t: '✨ Suy luận d₁:', latex: RAW`\(d_1 = 2\sqrt{a^2 - (d_2/2)^2} \approx \)`, val: R.d1, u: 'L' });
      if (R.deducedAlpha) st.push({ t: '✨ Suy luận góc α:', latex: RAW`\(\alpha = \arcsin(S/a^2) \approx \)`, val: R.alpha, u: 'deg' });
      st.push({ t: '1. Chu vi (C):', latex: RAW`\(C = 4a \approx \)`, val: R.perimeter, u: 'L' });
      if (R.hasArea) {
        const how = R.mode === 'SIDE_ANGLE' ? RAW`\(S = a^2\sin\alpha \approx \)` : RAW`\(S = \dfrac{d_1d_2}{2} \approx \)`;
        st.push({ t: '2. Diện tích (S):', latex: how, val: R.area, u: 'S' });
      }
      if (R.hasInradius) st.push({ t: '3. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{d_1d_2}{4a} \approx \)`, val: R.inradius, u: 'L' });
      R.steps = st;
      return { R };
    }
  },
  /* ---------- hinh-luc-giac-deu ---------- */
  'hinh-luc-giac-deu': {
    run(v) {
      const a = optNum(v, 'a'), p = optNum(v, 'p'), s = optNum(v, 's'), rr = optNum(v, 'r'),
        rIn = optNum(v, 'rIn'), d1 = optNum(v, 'd1'), d2 = optNum(v, 'd2');
      if (a === null && p === null && s === null && rr === null && rIn === null && d1 === null && d2 === null)
        return { err: 'Vui lòng nhập ít nhất 1 thông số (cạnh a, chu vi P, diện tích S, bán kính R/r hoặc đường chéo).' };
      let A = 0, mode = 'Cạnh a', ded = false;
      if (a !== null) { A = a; }
      else if (p !== null) { A = p / 6; mode = 'Chu vi P'; ded = true; }
      else if (s !== null) { A = Math.sqrt(2 * s / (3 * Math.sqrt(3))); mode = 'Diện tích S'; ded = true; }
      else if (rr !== null) { A = rr; mode = 'Bán kính ngoại tiếp R'; ded = true; }
      else if (rIn !== null) { A = 2 * rIn / Math.sqrt(3); mode = 'Bán kính nội tiếp r'; ded = true; }
      else if (d1 !== null) { A = d1 / 2; mode = 'Đường chéo chính d₁'; ded = true; }
      else if (d2 !== null) { A = d2 / Math.sqrt(3); mode = 'Đường chéo phụ d₂'; ded = true; }
      const R = { a: A, perimeter: 6 * A, area: 3 * Math.sqrt(3) / 2 * A * A, circumradius: A, inradius: A * Math.sqrt(3) / 2, majorDiagonal: 2 * A, minorDiagonal: A * Math.sqrt(3), inputMode: mode, deducedFromOther: ded };
      const st = [];
      if (ded) st.push({ t: '✨ Suy luận cạnh a từ ' + mode + ':', latex: RAW`\(a \approx \)`, val: A, u: 'L' });
      st.push(
        { t: '1. Chu vi (P):', latex: RAW`\(P = 6a \approx \)`, val: R.perimeter, u: 'L' },
        { t: '2. Diện tích (S):', latex: RAW`\(S = \dfrac{3\sqrt{3}}{2}a^2 \approx \)`, val: R.area, u: 'S' },
        { t: '3. Bán kính ngoại tiếp R & nội tiếp r:', latex: RAW`\(R = a \approx ${fmt(R.circumradius)};\quad r = \dfrac{a\sqrt{3}}{2} \approx \)`, val: R.inradius, u: 'L' },
        { t: '4. Đường chéo chính & phụ:', latex: RAW`\(d_1 = 2a \approx ${fmt(R.majorDiagonal)};\quad d_2 = a\sqrt{3} \approx \)`, val: R.minorDiagonal, u: 'L' },
      );
      R.steps = st;
      return { R };
    }
  },
  /* ---------- hinh-elip ---------- */
  'hinh-elip': {
    run(v) {
      let a = optNum(v, 'a'), b = optNum(v, 'b'), c = optNum(v, 'c'), e = optNum(v, 'e'), s = optNum(v, 's');
      const twoA = optNum(v, 'twoA'), twoB = optNum(v, 'twoB'), twoC = optNum(v, 'twoC');
      if (a === null && twoA !== null) a = twoA / 2;
      if (b === null && twoB !== null) b = twoB / 2;
      if (c === null && twoC !== null) c = twoC / 2;
      if (e !== null && e >= 1) e = null;
      const valid = (a !== null && b !== null) || (twoA !== null && twoB !== null) ||
        (a !== null && c !== null) || (b !== null && c !== null) || (a !== null && s !== null) || (a !== null && e !== null);
      if (!valid) return { err: 'Vui lòng nhập đủ cặp thông số (ví dụ: bán trục a & b, hoặc trục 2a & 2b, hoặc a & c, hoặc a & diện tích S).' };
      const effA = a !== null ? a : 0, effC = c !== null ? c : 0;
      if (effA > 0 && effC > 0 && effA <= effC) return { err: 'Bán trục lớn a (' + effA + ') phải lớn hơn bán tiêu cự c (' + effC + ').' };
      if (a !== null && b !== null && a < b) { const t2 = a; a = b; b = t2; }
      let A = 0, B = 0, C = 0, E = 0, type = 'Bán trục a & b', ded = false;
      if (a !== null && b !== null) { A = a; B = b; C = Math.sqrt(Math.max(0, A * A - B * B)); }
      else if (a !== null && c !== null && a > c) { A = a; C = c; B = Math.sqrt(A * A - C * C); type = 'Bán trục a & Tiêu cự c'; ded = true; }
      else if (b !== null && c !== null) { B = b; C = c; A = Math.sqrt(B * B + C * C); type = 'Bán trục b & Tiêu cự c'; ded = true; }
      else if (a !== null && s !== null) { A = a; B = s / (PI * A); C = Math.sqrt(Math.max(0, A * A - B * B)); type = 'Bán trục a & Diện tích S'; ded = true; }
      else if (a !== null && e !== null) { A = a; E = e; C = E * A; B = Math.sqrt(Math.max(0, A * A - C * C)); type = 'Bán trục a & Tâm sai e'; ded = true; }
      else return { err: 'Không thể suy luận từ các dữ kiện đã nhập. Vui lòng kiểm tra lại.' };
      if (!(A > 0 && B > 0)) return { err: 'Không thể suy luận từ các dữ kiện đã nhập. Vui lòng kiểm tra lại.' };
      C = Math.sqrt(Math.max(0, A * A - B * B)); E = C / A;
      const area = PI * A * B;
      const per = PI * (3 * (A + B) - Math.sqrt((3 * A + B) * (A + 3 * B)));
      const R = { a: A, b: B, c: C, e: E, area, perimeter: per, majorAxis: 2 * A, minorAxis: 2 * B, focalDistance: 2 * C, calculationType: type, deduced: ded };
      R.steps = [
        { t: '1. Phương trình chính tắc:', latex: RAW`\[\dfrac{x^2}{(${fmt(A)})^2} + \dfrac{y^2}{(${fmt(B)})^2} = 1\]`, val: null, u: null },
        { t: '2. Kích thước các trục:', latex: RAW`\(2a = ${fmt(2 * A)};\quad 2b = ${fmt(2 * B)}\)`, val: null, u: null },
        { t: '3. Bán tiêu cự & tiêu điểm:', latex: RAW`\(c = \sqrt{a^2-b^2} \approx ${fmt(C)};\quad F_1(-${fmt(C)},0), F_2(${fmt(C)},0)\)`, val: null, u: null },
        { t: '4. Tâm sai:', latex: RAW`\(e = \dfrac{c}{a} \approx \)`, val: E, u: null },
        { t: '5. Diện tích:', latex: RAW`\(S = \pi ab \approx \)`, val: area, u: 'S' },
        { t: '6. Chu vi (Ramanujan):', latex: RAW`\(C \approx \pi[3(a+b) - \sqrt{(3a+b)(a+3b)}] \approx \)`, val: per, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hop-chu-nhat ---------- */
  'hop-chu-nhat': {
    run(v) {
      const r = reqAll(v, ['a', 'b', 'c']); if (r.err) return r;
      const { a, b, c } = r.vals;
      const d = Math.sqrt(a * a + b * b + c * c);
      const R = { a, b, c, volume: a * b * c, surfaceArea: 2 * (a * b + b * c + c * a), diagonal: d, circumradius: d / 2 };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = abc = \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần:', latex: RAW`\(S_{tp} = 2(ab+bc+ca) = \)`, val: R.surfaceArea, u: 'S' },
        { t: '3. Đường chéo (d):', latex: RAW`\(d = \sqrt{a^2+b^2+c^2} \approx \)`, val: R.diagonal, u: 'L' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{d}{2} \approx \)`, val: R.circumradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-lap-phuong ---------- */
  'hinh-lap-phuong': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a, s3 = Math.sqrt(3);
      const R = { a, volume: a * a * a, surfaceArea: 6 * a * a, diagonal: a * s3, circumsphereRadius: a * s3 / 2, inradius: a / 2 };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = a^3 = \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần:', latex: RAW`\(S_{tp} = 6a^2 = \)`, val: R.surfaceArea, u: 'S' },
        { t: '3. Đường chéo (d):', latex: RAW`\(d = a\sqrt{3} \approx \)`, val: R.diagonal, u: 'L' },
        { t: '4. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{a\sqrt{3}}{2} \approx \)`, val: R.circumsphereRadius, u: 'L' },
        { t: '5. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{a}{2} = \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- lang-tru ---------- */
  'lang-tru': {
    run(v) {
      const r = reqAll(v, ['baseArea', 'h']); if (r.err) return r;
      const { baseArea: B, h } = r.vals;
      const R = { baseArea: B, h, volume: B * h };
      R.steps = [{ t: '1. Thể tích (V):', latex: RAW`\(V = B h = (${B})(${h}) = \)`, val: R.volume, u: 'V' }];
      return { R };
    }
  },
  /* ---------- hinh-chop ---------- */
  'hinh-chop': {
    run(v) {
      const r = reqAll(v, ['baseArea', 'h']); if (r.err) return r;
      const { baseArea: B, h } = r.vals;
      const R = { baseArea: B, h, volume: B * h / 3 };
      R.steps = [{ t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{1}{3}Bh = \)`, val: R.volume, u: 'V' }];
      return { R };
    }
  },
  /* ---------- hinh-chop-cut ---------- */
  'hinh-chop-cut': {
    run(v) {
      const r = reqAll(v, ['s', 'sp', 'h']); if (r.err) return r;
      const { s: S, sp: Sp, h } = r.vals;
      const R = { s: S, sPrime: Sp, h, volume: h / 3 * (S + Sp + Math.sqrt(S * Sp)) };
      R.steps = [{ t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{h}{3}(S + S' + \sqrt{SS'}) = \)`, val: R.volume, u: 'V' }];
      return { R };
    }
  },
  /* ---------- hinh-tru ---------- */
  'hinh-tru': {
    run(v) {
      const r = reqAll(v, ['r', 'h']); if (r.err) return r;
      const { r: x, h } = r.vals;
      const R = { r: x, h, volume: PI * x * x * h, lateralArea: 2 * PI * x * h, surfaceArea: 2 * PI * x * (h + x) };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \pi r^2h = \pi(${x})^2(${h}) \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích xung quanh:', latex: RAW`\(S_{xq} = 2\pi rh \approx \)`, val: R.lateralArea, u: 'S' },
        { t: '3. Diện tích toàn phần:', latex: RAW`\(S_{tp} = 2\pi r(h+r) \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-non ---------- */
  'hinh-non': {
    run(v) {
      const r = reqAll(v, ['r', 'h']); if (r.err) return r;
      const { r: x, h } = r.vals;
      const l = Math.sqrt(x * x + h * h);
      const R = { r: x, h, slantHeight: l, volume: PI * x * x * h / 3, lateralArea: PI * x * l, surfaceArea: PI * x * (l + x) };
      R.steps = [
        { t: '1. Đường sinh (l):', latex: RAW`\(l = \sqrt{r^2+h^2} \approx \)`, val: l, u: 'L' },
        { t: '2. Thể tích (V):', latex: RAW`\(V = \dfrac{1}{3}\pi r^2h \approx \)`, val: R.volume, u: 'V' },
        { t: '3. Diện tích xung quanh:', latex: RAW`\(S_{xq} = \pi rl \approx \)`, val: R.lateralArea, u: 'S' },
        { t: '4. Diện tích toàn phần:', latex: RAW`\(S_{tp} = \pi r(l+r) \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-non-cut ---------- */
  'hinh-non-cut': {
    run(v) {
      const r = reqAll(v, ['r', 'rp', 'h']); if (r.err) return r;
      const { r: x, rp, h } = r.vals;
      const l = Math.sqrt(h * h + SQ(x - rp));
      const R = { r: x, rPrime: rp, h, slantHeight: l, volume: PI * h / 3 * (x * x + x * rp + rp * rp), lateralArea: PI * (x + rp) * l };
      R.steps = [
        { t: '1. Đường sinh (l):', latex: RAW`\(l = \sqrt{h^2+(r-r')^2} \approx \)`, val: l, u: 'L' },
        { t: '2. Thể tích (V):', latex: RAW`\(V = \dfrac{1}{3}\pi h(r^2+rr'+r'^2) \approx \)`, val: R.volume, u: 'V' },
        { t: '3. Diện tích xung quanh:', latex: RAW`\(S_{xq} = \pi(r+r')l \approx \)`, val: R.lateralArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- hinh-cau ---------- */
  'hinh-cau': {
    run(v) {
      const r = reqAll(v, ['r']); if (r.err) return r;
      const x = r.vals.r;
      const R = { r: x, volume: 4 / 3 * PI * x * x * x, surfaceArea: 4 * PI * x * x };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{4}{3}\pi R^3 = \dfrac{4}{3}\pi(${x})^3 \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích mặt cầu (S):', latex: RAW`\(S = 4\pi R^2 = 4\pi(${x})^2 \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- tu-dien-deu ---------- */
  'tu-dien-deu': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a, s2 = Math.sqrt(2), s3 = Math.sqrt(3), s6 = Math.sqrt(6);
      const R = { a, volume: a * a * a * s2 / 12, surfaceArea: a * a * s3, faceArea: a * a * s3 / 4, height: a * s6 / 3, circumradius: a * s6 / 4, inradius: a * s6 / 12 };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{a^3\sqrt{2}}{12} = \dfrac{(${a})^3\sqrt{2}}{12} \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần (S_tp):', latex: RAW`\(S_{tp} = a^2\sqrt{3} = (${a})^2\sqrt{3} \approx \)`, val: R.surfaceArea, u: 'S' },
        { t: '3. Diện tích 1 mặt:', latex: RAW`\(S_1 = \dfrac{a^2\sqrt{3}}{4} \approx \)`, val: R.faceArea, u: 'S' },
        { t: '4. Chiều cao (h):', latex: RAW`\(h = \dfrac{a\sqrt{6}}{3} \approx \)`, val: R.height, u: 'L' },
        { t: '5. Bán kính ngoại tiếp (R):', latex: RAW`\(R = \dfrac{a\sqrt{6}}{4} \approx \)`, val: R.circumradius, u: 'L' },
        { t: '6. Bán kính nội tiếp (r):', latex: RAW`\(r = \dfrac{a\sqrt{6}}{12} \approx \)`, val: R.inradius, u: 'L' },
      ];
      return { R };
    }
  },
  /* ---------- bat-dien-deu ---------- */
  'bat-dien-deu': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a;
      const R = { a, volume: a * a * a * Math.sqrt(2) / 3, surfaceArea: 2 * a * a * Math.sqrt(3) };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{a^3\sqrt{2}}{3} = \dfrac{(${a})^3\sqrt{2}}{3} \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần (S_tp):', latex: RAW`\(S_{tp} = 2a^2\sqrt{3} = 2(${a})^2\sqrt{3} \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- muoi-hai-mat-deu ---------- */
  'muoi-hai-mat-deu': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a, s5 = Math.sqrt(5);
      const R = { a, volume: a * a * a * (15 + 7 * s5) / 4, surfaceArea: 3 * Math.sqrt(25 + 10 * s5) * a * a };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{a^3(15+7\sqrt{5})}{4} \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần (S_tp):', latex: RAW`\(S_{tp} = 3\sqrt{25+10\sqrt{5}}\cdot a^2 \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- hai-muoi-mat-deu ---------- */
  'hai-muoi-mat-deu': {
    run(v) {
      const r = reqAll(v, ['a']); if (r.err) return r;
      const a = r.vals.a, s5 = Math.sqrt(5);
      const R = { a, volume: 5 * a * a * a * (3 + s5) / 12, surfaceArea: 5 * a * a * Math.sqrt(3) };
      R.steps = [
        { t: '1. Thể tích (V):', latex: RAW`\(V = \dfrac{5a^3(3+\sqrt{5})}{12} \approx \)`, val: R.volume, u: 'V' },
        { t: '2. Diện tích toàn phần (S_tp):', latex: RAW`\(S_{tp} = 5a^2\sqrt{3} \approx \)`, val: R.surfaceArea, u: 'S' },
      ];
      return { R };
    }
  },
  /* ---------- chom-cau ---------- */
  'chom-cau': {
    run(v) {
      const r = reqAll(v, ['r', 'h']); if (r.err) return r;
      const { r: x, h } = r.vals;
      const R = { r: x, h, surfaceArea: 2 * PI * x * h, volume: PI * h * h * (x - h / 3) };
      R.steps = [
        { t: '1. Diện tích xung quanh (S_xq):', latex: RAW`\(S_{xq} = 2\pi Rh = 2\pi(${x})(${h}) \approx \)`, val: R.surfaceArea, u: 'S' },
        { t: '2. Thể tích (V):', latex: RAW`\(V = \pi h^2\left(R - \dfrac{h}{3}\right) \approx \)`, val: R.volume, u: 'V' },
      ];
      return { R };
    }
  },
  /* ---------- doi-cau ---------- */
  'doi-cau': {
    run(v) {
      const r = reqAll(v, ['r1', 'r2', 'h']); if (r.err) return r;
      const { r1, r2, h } = r.vals;
      const R = { r1, r2, h, volume: PI * h * (3 * r1 * r1 + 3 * r2 * r2 + h * h) / 6 };
      R.steps = [
        { t: '1. Thể tích đới cầu (V):', latex: RAW`\(V = \dfrac{1}{6}\pi h(3r_1^2+3r_2^2+h^2) \approx \)`, val: R.volume, u: 'V' },
      ];
      return { R };
    }
  },
};

if (typeof module !== 'undefined') module.exports = { CALCS, fmt, num };
