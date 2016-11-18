import djsfy from './djsfy';

// Edge / IE
const MS = 'ms';
// Chrome / Safari
const WEBKIT = 'webkit';
// Firefox
const MOZ = 'moz';
// Opera
const O = 'o';
const XV = 'xv';
// KDE
const KHTML = 'khtml'; 

const PREFIXIES = [MS, WEBKIT, MOZ, O, XV, KHTML];

const CSS_PREFIXED = {
  float: 'cssFloat'
};

export function css(node, cssStyles) {
  if (!node || node.nodeType === 8 || node.nodeType === 3 || !node.style) {
    return null;
  }

  for (let key in cssStyles) {
    if (Object.hasOwnProperty.call(cssStyles, key)) {
      let keyPrefixed = getStyleWithPrefixKey({
        styleList: node.style, 
        styleToCheck: key
      });

      if (keyPrefixed) {
        node.style[keyPrefixed] = cssStyles[key];
      }
    }
  }

  return djsfy(node);
}

export function addClass(node, classList) {
  let currentClassList = node.getAttribute('class') || '';

  classList = parseArray(classList) || [];

  if (classList instanceof Array){
    for (let i = 0, length = classList.length; i < length; i++) {
      if (!classList[i].trim()) {
        throw new SyntaxError('djs.addClass(): Empty strings are not valid class name');
      }

      if (!containsClassIntoList(currentClassList, classList[i])) {
        currentClassList += ' ' + classList[i].trim();
      }
    }
  }

  node.setAttribute('class', currentClassList.trim());

  return djsfy(node);
}

export function containsClass(node, className) {
  if (!node) {
    throw new Error('The element must be not empty.');
  }

  assertClassName(className);

  return containsClassIntoList(node.getAttribute('class'), className);
}

export function removeClass(node, classToRemove) {
  let currentClassList = getCurrentClassList(node);

  classToRemove = parseArray(classToRemove) || [];

  if (!currentClassList.length || !classToRemove.length) {
    return djsfy(node);
  }

  if (classToRemove instanceof Array) {
    classToRemoveInteraction:
    for(let i = 0, length = classToRemove.length; i < length; i++) {
      let className = classToRemove[i];
      assertClassName(className);

      currentClassListInteraction:
      for(let y = 0, length = currentClassList.length; y < length; y++) {
        if (className === currentClassList[y]) {
          currentClassList.splice(y, 1);
          continue classToRemoveInteraction;
        }
      }
    }
  }

  node.setAttribute('class', currentClassList.join(' '));

  return djsfy(node);
}

export function toggleClass(node, className, force) {
  if (!node) {
    throw new Error('The element must be not empty.');
  }

  assertClassName(className);

  let currentClassList = getCurrentClassList(node);

  if (containsClassIntoList(currentClassList, className)) {
    if (!force) {
      removeClass(node, className);
    }
  } else {
    if (force !== false) {
      addClass(node, className);
    }
  }

  return djsfy(node);
}

function getCurrentClassList(node) {
  return parseArray(node.getAttribute('class')) || [];
}

function assertClassName(className) {
  if (!className) {
    throw new Error(`The className provided ('${className}') must be not empty.`);
  }

  if (containsWhitespaces(className)) {
    throw new Error(`The className provided ('${className}') contains HTML space characters, which are not valid.`);
  }
}

function containsWhitespaces(string) {
  return string.match(/\s/);
}

function containsClassIntoList(classList, classToCheck) {
  classList = parseArray(classList) || [];

  for (let i = 0, length = classList.length; i < length; i++) {
    if (classList[i].trim() === classToCheck.trim()) {
      return true;
    }
  }

  return false;
}

function parseArray(classList) {
  if (typeof classList === 'string') {
    classList = classList.split(' ');
  }

  return classList;
}

function getStyleWithPrefixKey({styleList, styleToCheck}) {
  if (styleToCheck in styleList) {
    return styleToCheck;
  }

  if (styleToCheck in CSS_PREFIXED) {
    return CSS_PREFIXED[styleToCheck];
  }

  for (let i = 0, length = PREFIXIES.length; i < length; i++) {
    let styleWithPrefix = `${PREFIXIES[i]}${styleToCheck[0].toUpperCase()}${styleToCheck.substring(1)}`;

    if (styleWithPrefix in styleList) {
      CSS_PREFIXED[styleToCheck] = styleWithPrefix;
      return CSS_PREFIXED[styleToCheck];
    }
  }

  return false;
}