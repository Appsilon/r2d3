import html from '../util/html.js';
import {create, remove} from './manipulation.js';
import {find, findAll} from './find.js';
import * as styles from './styles.js';

function djs(template, ...substs) {
  if (typeof template === 'string') {
    return find(template);
  } else if(Array.isArray(template)) {
    return html(template, ...substs);
  }
}

djs.create = create;
djs.css = styles.css;
djs.addClass = styles.addClass;
djs.removeClass = styles.removeClass;
djs.toggleClass = styles.toggleClass;
djs.containsClass = styles.containsClass;
djs.find = find;
djs.findAll = findAll;
djs.remove = remove;

export default djs;
