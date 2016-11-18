import djsfy from './djsfy.js';

export function create(string) {
  let fragment = document.createDocumentFragment();
  let element = fragment.appendChild(document.createElement('div'));

  element.innerHTML = string.trim();

  if (element.childNodes.length === 1) {
    element = element.lastChild;
  }

  return djsfy(element.cloneNode(true));
}

export function remove(node) {
  if (node.parentNode) {
    return node.parentNode.removeChild(node);
  }

  return null;
}