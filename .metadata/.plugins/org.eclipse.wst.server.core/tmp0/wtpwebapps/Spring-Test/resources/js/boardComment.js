
document.getElementById('cmtPostBtn').addEventListener('click',()=>{
    const cmtText=document.getElementById('cmtText');
    console.log(cmtText.value);
    if(cmtText.value==null||cmtText.value==''){
        alert("댓글을 입력해주세요.");
        cmtText.focus();
        return false;
    }else{
        let cmtData={
            bno : bnoVal,
            writer : document.getElementById('cmtWriter').innerText,
            content : cmtText.value
        };
        console.log(cmtData);
        postCommentServer(cmtData).then(result=>{
            if(result>0){
                alert('댓글 등록 성공~!!');
            }
            //화면에 출력
            getCommentList(cmtData.bno);
        });
    }
});

async function postCommentServer(cmtData){
    try {
        const url='/comment/post';
        const config={
            method : 'post',
            headers : {
                'content-type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function spreadCommentFromServer(bno){
    console.log(bno);
    try {
        const resp=await fetch('/comment/'+bno);
        const result=await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

function getCommentList(bno){
    spreadCommentFromServer(bno).then(result=>{
    console.log(result);
    const ul=document.getElementById('cmtListArea');
    if(result.length>0){
        ul.innerHTML="";
        for(let cvo of result){
            let li=`<li data-cno="${cvo.cno}" class="list-group-item d-flex justify-content-between align-items-start">`;
                li+=`<div class="ms-2 me-auto"><div class="fw-bold">${cvo.writer}</div>`;
                li+=`<input type="text" class="form-control" id="cmtTextMod" value="${cvo.content}"></div>`;
                li+=`<span class="badge bg-dark rounded-pill">${cvo.mod_at}</span>`;
                li+=`<button class="btn btn-success mod" id="cmtPostBtn" type="button">%</button>`;
                li+=`<button class="btn btn-success del" id="cmtPostBtn" type="button">x</button>`;
                li+=`</li>`;
                ul.innerHTML+=li;
            }
        }else{
                let li=`<li class="list-group-item d-flex justify-content-between align-items-start">`;
                ul.innerHTML+=li;
            }
    })
}

async function editCommentToServer(cmtTextMod){
    try {
        const url='/comment/'+cmtTextMod.cno;
        const config={
            method : 'put',
            headers : {
                'content-type' : 'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtTextMod)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function removeCommentAtServer(cno){
    try {
        const url='/comment/'+cno;
        const config={
            method : 'delete'
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function removeCommentToServer(cmtDatadel){
	try{
		const url='/comment/'+cmtDatadel.cno;
		const config={
			method : 'delete'
		};
			const resp = await fetch(url,config);
			const result = await resp.text();
			return result;
	}catch(error){
		console.log(error);
	}
}


document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('mod')){
        let li=e.target.closest('li');
        let cnoVal=li.dataset.cno;
        let textContent=li.querySelector('#cmtTextMod').value;

        let cmtDataMod={
            cno : cnoVal,
            content : textContent
        };
        console.log(cmtDataMod);
        editCommentToServer(cmtDataMod).then(result=>{
            if(result>0){
                alert('댓글 수정 성공~!!');
            }
            getCommentList(bnoVal);
        });
    }else if(e.target.classList.contains('del')){
        //삭제 값 처리
        let li=e.target.closest('li');
        let cnoVal=li.dataset.cno;
        console.log(cnoVal);
        
        let cmtDatadel ={
        cno:cnoVal
   		}
   		
   		removeCommentToServer(cmtDatadel).then(result=>{
   		if(result>0){
   			alert('댓글 삭제 성공');
   			}
   			getCommentList(bnoVal);
   			})
   			}
})
