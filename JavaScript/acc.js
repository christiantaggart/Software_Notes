let arStr =['hey', 'I', 'think', 'your', 'array', 'object']
var s = arStr.slice(0, arStr.length - 1).join(', ') + ", and " + arStr.slice(-1).toString();
console.log(s);
