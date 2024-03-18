export default function createImageSrc() {
    let image_src = {
        picture: document.querySelector('#profile_pic').src,
    };

    return image_src;
}