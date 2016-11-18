import djsfy from './djsfy';

export function find(string, rootElement=document) {
  return djsfy(rootElement.querySelector(string));
}

export function findAll(string, rootElement=document) {
  return rootElement.querySelectorAll(string);
}