appendStyle = function(css) {
  var head = document.head || document.getElementsByTagName('head')[0];
  var style = document.createElement('style');

  style.type = 'text/css';
  if (style.styleSheet){
    style.styleSheet.cssText = css;
  } else {
    style.appendChild(document.createTextNode(css));
  }

  head.appendChild(style);
};

var execute_save = function(env, inst) {
  console.log(inst);
  return env;
};

var execute_get = function(env, inst) {
};

var tryToGetFunctions = function(value) {
  try {
    var evaluated = eval("(" + value + ")");
    if (typeof evaluated === "function") {
      return evaluated;
    }
    return value;
  } catch(e) {}
  return value;
};

var execute_instruction = function(env, inst_parts) {
  var current;
  for(var it = 0; it < inst_parts.length; ++it) {
    var elem = inst_parts[it];
    switch(elem.command) {
      case "save_var":
        env[elem.args.name] = current;
        break;
      case "get_var":
        current = env[elem.args.name] || window[elem.args.name];
        break;
      case "apply":
        console.log("apply", elem.fun);
        var evaluated_args = elem.args.map(function(arg) {
          if (Array.isArray(arg) && arg[0].command) {
            // TODO: this should be more robust than simple heuristic.
            return execute_instruction(env, arg);
          }
          return tryToGetFunctions(arg);
        });
        if (elem.fun === "data") {
          d = evaluated_args[0];
          evaluated_args[0] = (new Array(d[Object.keys(d)[0]].length).fill(undefined)).map(function(_, i) {
            var o = {};
            Object.keys(d).forEach(function(key) { o[key]= d[key][i]});
            return o;
          });
        }
        current = current[elem.fun].apply(current, evaluated_args);
        break;
      default:
        throw "Unrecognized instruction: " + elem.command;
    }
  }
  return current;
};

HTMLWidgets.widget({
  name: "r2d3",
  type: "output",

  factory: function(el, width, height) {
    return {
      renderValue: function(wrapped_insts) {
        insts = Object.keys(wrapped_insts).map(function(key) {
          return wrapped_insts[key];
        });

        var env = {};
        for (it = 0; it < insts.length; ++it) {
          console.log("instruction ", it);
          execute_instruction(env, insts[it]);
        }
      },

      resize: function(width, height) {
      },

      // Make the sigma object available as a property on the widget
      // instance we're returning from factory(). This is generally a
      // good idea for extensibility--it helps users of this widget
      // interact directly with sigma, if needed.
      // r2d3: sig
    };
  }
});
