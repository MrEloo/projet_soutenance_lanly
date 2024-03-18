const ratio = .5

const options = {
    root: null,
    rootMargin: "0px",
    threshold: ratio,
};

const handleIntersect = (entries, observer) => {
    entries.forEach(entry => {
        if (entry.intersectionRatio > ratio) {
            entry.target.classList.add('reveal_visible')
            observer.unobserve(entry.target)
        } else {
            console.log('invisible')
        }
    });
}

const observer = new IntersectionObserver(handleIntersect, options);
document.querySelectorAll('[class*="reveal-"]').forEach((r) => {
    observer.observe(r)
})
