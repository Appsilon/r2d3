export default function htmlStringFromTemplateString(templateObject, ...substs) {
  let raw = templateObject.raw;

  let result;

  result = substs.reduce((result, subst, i) => {
    let lit = raw[i];

    subst = Array.isArray(subst) ? subst.join('') : subst + '';

    if (lit[lit.length-1] === '$') {
      subst = htmlEscape(subst);
      lit = lit.slice(0, -1);
    }

    result += lit;
    result += subst;

    return result;
  }, '');

  result += raw[raw.length-1];

  return result;
}

function htmlEscape(str) {
  return str
    .replace(/&/g, '&amp;')
    .replace(/>/g, '&gt;')
    .replace(/</g, '&lt;')
    .replace(/"/g, '&quote;')
    .replace(/'/g, '&#39;')
    .replace(/`/g, '&#96;');
}