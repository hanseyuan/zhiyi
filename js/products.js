//起始: 让id为container下的第一个div在最上层
document.querySelector("#container>div:first-child")
        .style.zIndex=10;

/*
查找触发事件的元素
绑定事件
  查找要修改的元素
  修改元素
*/
//查找class为tabs下的data-trigger属性为tab的元素
var as=document.querySelectorAll(
  ".tabs [data-trigger=tab]"
);
for(var a of as){//遍历as中每个a
  a.onclick=function(){//为每个a绑定单击事件
    //获得当前a的href属性作为id选择器
    var i=this.href.lastIndexOf("#");
    var id=this.href.slice(i);
    console.log(id);//打桩
    //用id选择器查找对应div
    var targetDiv=document.querySelector(id);
    //如果对应div的zIndex是""
    console.log(targetDiv);//打桩
    if(targetDiv.style.zIndex==""){
      //查找id为container下的所有div
      var divs=document.querySelectorAll(
        "#container>div"
      );
      for(var div of divs)//遍历每个div
        div.style.zIndex="";//清除div的zIndex
      //设置对应div的zIndex为10
      targetDiv.style.zIndex=10;
    }
  }
}