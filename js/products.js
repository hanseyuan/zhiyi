//��ʼ: ��idΪcontainer�µĵ�һ��div�����ϲ�
document.querySelector("#container>div:first-child")
        .style.zIndex=10;

/*
���Ҵ����¼���Ԫ��
���¼�
  ����Ҫ�޸ĵ�Ԫ��
  �޸�Ԫ��
*/
//����classΪtabs�µ�data-trigger����Ϊtab��Ԫ��
var as=document.querySelectorAll(
  ".tabs [data-trigger=tab]"
);
for(var a of as){//����as��ÿ��a
  a.onclick=function(){//Ϊÿ��a�󶨵����¼�
    //��õ�ǰa��href������Ϊidѡ����
    var i=this.href.lastIndexOf("#");
    var id=this.href.slice(i);
    console.log(id);//��׮
    //��idѡ�������Ҷ�Ӧdiv
    var targetDiv=document.querySelector(id);
    //�����Ӧdiv��zIndex��""
    console.log(targetDiv);//��׮
    if(targetDiv.style.zIndex==""){
      //����idΪcontainer�µ�����div
      var divs=document.querySelectorAll(
        "#container>div"
      );
      for(var div of divs)//����ÿ��div
        div.style.zIndex="";//���div��zIndex
      //���ö�Ӧdiv��zIndexΪ10
      targetDiv.style.zIndex=10;
    }
  }
}