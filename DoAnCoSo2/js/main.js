let nav = document.getElementById('header');
let items = document.querySelectorAll('.item');
let itemsTab = document.querySelectorAll('.itemTab');
document.addEventListener('scroll', (event) => {
    if (window.scrollY > 400) {
        nav.classList.add('toFixed');
    } else {
        nav.classList.remove('toFixed');
    }
    items.forEach(item => {
        if (item.offsetTop - window.scrollY < 700) {
            item.classList.add('active');
        }
    })
    itemsTab.forEach(itemTab => {
        if (itemTab.offsetTop - window.scrollY < 600) {
            itemTab.classList.add('activeTab');
        }
    })
})


// thay đổi số lượng chi tiết sản phẩm

let qtyDec = document.querySelector('.dec');
let qtyInc = document.querySelector('.inc');
let qtyPro = document.querySelector('.amount-product');

qtyDec.addEventListener('click', () => {
    qtyPro.value = qtyPro.value - 1;
})

qtyInc.addEventListener('click', () => {
    qtyPro.value = Number(qtyPro.value) + 1;
})

// phản hồi bình luận người khác

let reply = document.querySelector('.reply');
let answer = document.querySelector('.answer');
reply.addEventListener('click', () => {
    answer.classList.add('answerDisplay');
})
