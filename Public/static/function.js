//将对象转换为字符串
function obj2str(o){ 
var r = []; 
if(typeof o =="string") return "\""+o.replace(/([\'\"\\])/g,"\\$1").replace(/(\n)/g,"\\n").replace(/(\r)/g,"\\r").replace(/(\t)/g,"\\t")+"\""; 
if(typeof o == "object"){ 
if(!o.sort){ 
for(var i in o) 
r.push(i+":"+obj2str(o[i])); 
if(!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)){ 
r.push("toString:"+o.toString.toString()); 
} 
r="{"+r.join()+"}" 
}else{ 
for(var i =0;i<o.length;i++) 
r.push(obj2str(o[i])) 
r="["+r.join()+"]" 
} 
return r; 
} 
return o.toString(); 
} 

/*
 * 检测对象是否是空对象(不包含任何可读属性)。
 * 方法既检测对象本身的属性，也检测从原型继承的属性(因此没有使hasOwnProperty)。
 */
function isEmpty(obj)
{
    for (var name
in obj)
    {
        return false;
    }
    return true;
};


/*
 * 正则表达式验证数据
 * @author 和蔼的木Q <545038947>
 */
function verifyString(str,strformat)
{
	switch (strformat)
	{
	case "number":
		var pattern = /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/;    //非负浮点数
		return(pattern.test(str)); 
		break;
	case "email":
		var pattern = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;    //电子邮件
		return(pattern.test(str)); 
		break;

	case "url":
		var pattern = /^[a-zA-z]+:\/\/(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$/;    //网址URL
		return(pattern.test(str)); 
		break;
	case "username":
		var pattern = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;    //合法用户名(字母开头，允许5-16字节，允许字母数字下划线)
		return(pattern.test(str)); 
		break;
	}
	return false;
}