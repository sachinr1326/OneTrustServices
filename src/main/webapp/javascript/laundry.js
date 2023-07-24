const progress= document.getElementById("progress");
const prev = document.getElementById("prev");
const next = document.getElementById("next");
const back = document.getElementById("back-btn");

const circles=document.querySelectorAll(".circle");
const image= document.getElementById("image");
const build1= document.getElementById("build-1");
const build2= document.getElementById("build-2");
const build3= document.getElementById("build-3");
const build4= document.getElementById("build-4");
const buttonsection= document.getElementById("button-section");

const progresschoose= document.getElementById("progress-choose");
const progressconfirm= document.getElementById("progress-confirm");
const progresspayment= document.getElementById("progress-payment");
const note = document.getElementById("note");
const imagetext= document.getElementById("image-text");

let currentActive=1;
next.addEventListener("click",()=>{
currentActive++;
if(currentActive>circles.length){
    currentActive=circles.length;

}
update();
});
prev.addEventListener("click",()=>{
    currentActive--;
    if(currentActive<1){
        currentActive=1;
       
    }
    update();
    });
    back.addEventListener("click",()=>{
        currentActive--;
        if(currentActive<1){
            currentActive=1;
           
        }
        update();
        });   
   

    function update(){
        circles.forEach((circle,idx)=>{
            if(idx < currentActive){
                circle.classList.add("active");
            }else{
                circle.classList.remove("active");
            }
        });
        const actives=document.querySelectorAll(".active");
        progress.style.width=((actives.length-2)/(circles.length-1))*100+"%";
        if(currentActive === 1){
	
            prev.disabled =true;
            next.disabled==false;
        
            buttonsection.style.display="block";
           image.style.backgroundImage="url(../images/module-I/module1.png)";
            build1.style.display="block";
            build2.style.display="none";
            build3.style.display="none";
            build4.style.display="none";
            progresschoose.style.color="#e0e0e0";
            progressconfirm.style.color="#e0e0e0";
             imagetext.innerText="Build Your Order";
            note.style.display="none";

            document.documentElement.scrollTop = 0;
        }else if(currentActive === circles.length){
           
            
           buttonsection.style.display="none";
            image.style.backgroundImage="url(../images/module-I/laundry4.png)";
            build3.style.display="none";
            build1.style.display="none";
            build2.style.display="none";
            build4.style.display="block";
            progresspayment.style.color="#7bbb43";
            imagetext.innerText="Pay as You Go"
            document.documentElement.scrollTop = 0;
            note.style.display="none";
        }else if(currentActive === 3){
            prev.disabled=false;
            next.disabled=false;
            buttonsection.style.display="block";
            image.style.backgroundImage="url(../images/module-I/laundry3.jpg)";
            build2.style.display="none";
            build3.style.display="block";
            build1.style.display="none";
            build4.style.display="none";
            
            progressconfirm.style.color="#7bbb43";
            progresspayment.style.color="#e0e0e0";
            document.documentElement.scrollTop = 0;
             
            next.innerHTML ='Confirm <i class="fas fa-long-arrow-alt-right"></i>';
            imagetext.innerText="Confirm To Proceed";
            note.style.display="block";




        } else {
            prev.disabled=false;
            next.disabled=false;
           
            buttonsection.style.display="block";
            image.style.backgroundImage="url(../images/module-I/laundry2.png)";
            build2.style.display="block";
            build3.style.display="none";
            build1.style.display="none";
            build4.style.display="none";
            progresschoose.style.color="#7bbb43";
            progressconfirm.style.color="#e0e0e0";
            progresspayment.style.color="#e0e0e0";
            document.documentElement.scrollTop = 0;
            imagetext.innerText="We Serve You Everywhere";
            next.innerHTML ='Next <i class="fas fa-long-arrow-alt-right"></i>';
            note.style.display="none";
        }
    }