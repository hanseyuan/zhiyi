//����header
(()=>{
    ajax("get","header.html","","text")
        .then(html=>{
        document.getElementById("header")
        .innerHTML=html;


//Ϊ��ǰ������ӹ����¼�����
	window.addEventListener("scroll",()=>{
		//(��ֹ��ҳ�������е����������¼���ͻ)
		//��ù����߶�:
		var scrollTop=
			document.body.scrollTop
			||
			document.documentElement.scrollTop;
	//��������߶�>=300
	if(scrollTop>=340)
	//����idΪheader�µ�classΪmain��div��classΪmain��fixed_nav
		document.querySelector(
			"#header-top"
		).className="clear fixed_nav";
	else//����
	//����idΪheader�µ�classΪmain��div��classΪmain
		document.querySelector(
			"#header-top"
		).className="clear";
	})
	})
})();