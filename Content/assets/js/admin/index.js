
const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});
const handleOnChangeInputImage = async (e,des="")=>{
    const base = await toBase64(e.files[0]);
    const destination =  document.getElementById(des);
    if(destination){
        destination.setAttribute("src", base);
    }
}