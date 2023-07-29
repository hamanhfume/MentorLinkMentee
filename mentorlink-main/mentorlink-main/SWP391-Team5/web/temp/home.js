
const mobileMenu = document.getElementById('mobile-menu');
const btnClick = document.getElementById('primary-menu-trigger1');

function hideMenu() {
    console.log(mobileMenu.style.display);
    if (mobileMenu.getAttribute('hide') == 'true') {
        mobileMenu.classList.add('mobile-menu-block')
        mobileMenu.classList.remove('mobile-menu-none')

        mobileMenu.setAttribute('hide', 'false')
    }
    else {
        mobileMenu.classList.add('mobile-menu-none')
        mobileMenu.classList.remove('mobile-menu-block')

        mobileMenu.setAttribute('hide', 'true')
    }
}
btnClick.addEventListener('click', hideMenu);

const dropdownLists = document.querySelectorAll('.dropdown_list');
console.log(dropdownLists);

dropdownLists.forEach( dropdownList => {
    var megaMenu = dropdownList.querySelector('.mega_menu_box');

    function megaMenuf(e) {
        e.preventDefault();
        if(megaMenu.style.display === 'block') {
            megaMenu.style.display = 'none';
            // console.log("a");
        }else {
            megaMenu.style.display = 'block';
            // console.log("b");
        }
        // console.log(megaMenu.style.display === 'block');
    }
    dropdownList.addEventListener('click', megaMenuf)
});


const userAvatar = document.getElementById('user-avatar');
const selectUserBox = document.getElementById('select_user_box');

function userBox() {
    if(selectUserBox.style.display === 'none') {
        selectUserBox.style.display = 'block';
    }
    else {
        selectUserBox.style.display = 'none';
    }
}
userAvatar.addEventListener('click', userBox);


