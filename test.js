window.addEventListener('DOMContentLoaded', () => {
    console.log('coucou')
    let url = 'test.php?route=categories'
    fetch(url)
        .then(r => r.json())
        .then(data => {
            console.log(data)
        })
})