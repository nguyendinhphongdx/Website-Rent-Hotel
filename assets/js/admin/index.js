
const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});
const handleOnChangeInputImage = async (e,des="")=>{
    const images = document.getElementsByClassName("image")[0];
    const files = e.files;
    console.log(files);
    for (let index = 0; index < files.length; index++) {
        const element = files[index];
        const base = await toBase64(element);
         const newImage = document.createElement("img");
         newImage.setAttribute("src", base);
         images.appendChild(newImage);
    }
}
const onLoad=()=>{
    ListenEvent();
}
const ListenEvent = () =>{
    const buttonsScroll = document.getElementsByClassName("scroll-card-info");
    for (let index = 0; index < buttonsScroll.length; index++) {
        buttonsScroll[index].addEventListener("click",()=>ScrollToCardInfor());
        
    }
}
const ScrollToCardInfor = () => {
    const cardInfor = document.getElementById("card-info");
    window.scrollTo({
        top:cardInfor.getBoundingClientRect().height,
        left:0,
        behavior:'smooth'
    });
}