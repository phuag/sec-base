var SIGN_REGEXP = /([yMdhsm])(\1*)/g
var DEFAULT_PATTERN = 'yyyy-MM-dd'
function padding (s, len) {
  len = len - (s + '').length
  for (var i = 0; i < len; i++) { s = '0' + s }
  return s
}

export default {
  getQueryStringByName: function (name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i')
    var r = window.location.search.substr(1).match(reg)
    var context = ''
    if (r != null) {
      context = r[2]
    }
    reg = null
    r = null
    return context == null || context === '' || context === 'undefined' ? '' : context
  },
  formatDate: {
    format: function (date, pattern) {
      pattern = pattern || DEFAULT_PATTERN
      return pattern.replace(SIGN_REGEXP, function ($0) {
        switch ($0.charAt(0)) {
          case 'y': return padding(date.getFullYear(), $0.length)
          case 'M': return padding(date.getMonth() + 1, $0.length)
          case 'd': return padding(date.getDate(), $0.length)
          case 'w': return date.getDay() + 1
          case 'h': return padding(date.getHours(), $0.length)
          case 'm': return padding(date.getMinutes(), $0.length)
          case 's': return padding(date.getSeconds(), $0.length)
        }
      })
    },
    parse: function (dateString, pattern) {
      var matchs1 = pattern.match(SIGN_REGEXP)
      var matchs2 = dateString.match(/(\d)+/g)
      if (matchs1.length === matchs2.length) {
        var _date = new Date(1970, 0, 1)
        for (var i = 0; i < matchs1.length; i++) {
          var _int = parseInt(matchs2[i])
          var sign = matchs1[i]
          switch (sign.charAt(0)) {
            case 'y': _date.setFullYear(_int); break
            case 'M': _date.setMonth(_int - 1); break
            case 'd': _date.setDate(_int); break
            case 'h': _date.setHours(_int); break
            case 'm': _date.setMinutes(_int); break
            case 's': _date.setSeconds(_int); break
          }
        }
        return _date
      }
      return null
    }
  },
  toTree: function (a, idStr, pidStr, chindrenStr) {
    let r = []; let hash = {}; let id = idStr; let pid = pidStr; let children = chindrenStr; let len = a.length
    for (let i = 0; i < len; i++) {
      hash[a[i][id]] = a[i]
    }
    for (let j = 0; j < len; j++) {
      let aVal = a[j]; let hashVP = hash[aVal[pid]]
      if (hashVP) {
        !hashVP[children] && (hashVP[children] = [])
        hashVP[children].push(aVal)
      } else {
        r.push(aVal)
      }
    }
    return r
  },
  // 获得id和对象的map
  getTreeHashMap (data, idStr) {
    let hash = {}
    let id = idStr
    for (let i = 0; i < data.length; i++) {
      hash[data[i][id]] = data[i]
    }
    return hash
  },
  getFullPath (hashMap, parentIdStrs, property, connectStr, currentStr) {
    let parentIds = parentIdStrs.split(',')
    let result = ''
    let prop = property
    for (let i in parentIds) {
      let pid = parentIds[i]
      let pNode = hashMap[pid]
      if (pNode) {
        result += pNode[prop] + connectStr
      }
    }
    if (result) {
      return result + currentStr
    } else {
      return currentStr
    }
  },
  checkTargetType (target) {
    return Object.prototype.toString.call(target).slice(8, -1)
  },
  clone (target) {
    let result
    let targetType = this.checkTargetType(target)
    if (targetType === 'Object' || targetType === 'Array') {
      result = targetType === 'Object' ? {} : []
    } else {
      return target
    }
    for (let i in target) {
      result[i] = this.clone(target[i])
    }
    return result
  }
}
