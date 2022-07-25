var myWidget = cloudinary.createUploadWidget({
  cloudName: 'tom22lw',
  uploadPreset: 'msev5gzw',
  sources: ['local']}, (error, result) => {
    if (!error && result && result.event === "success") {
    document.getElementById("release_software_url").value = result.info.secure_url;
    }
  }
)

document.getElementById("upload_widget").addEventListener("click", function(){
  myWidget.open();
}, false);
