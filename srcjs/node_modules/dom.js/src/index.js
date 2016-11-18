import djs from './djs/d.js';

if (typeof exports === 'object' && typeof module !== 'undefined') {
  module.exports = djs;
} else if (typeof define === 'function' && define.amd) {
  define([], () => djs);
}

let _global;

if (typeof window !== 'undefined') {
  _global = window;
} else if (typeof global !== 'undefined') {
  _global = global;
} else if (typeof self !== 'undefined') {
  _global = self;
} else {
  _global = this;
}

_global.djs = djs;
