const allStar = document.querySelectorAll('.rating .star');
const ratingValue = document.querySelector('.rating input');

allStar.forEach((item, idx) => {
  item.addEventListener('click', function () {
    let click = 0;
    const numberOfStars = idx + 1;

    ratingValue.value = numberOfStars;

    allStar.forEach((i) => {
      i.classList.replace('bxs-star', 'bx-star');
      i.classList.remove('active');
    });

    for (let i = 0; i < allStar.length; i++) {
      if (i <= idx) {
        allStar[i].classList.replace('bx-star', 'bxs-star');
        allStar[i].classList.add('active');
      } else {
        allStar[i].style.setProperty('--i', click);
        click++;
      }
    }

    console.log('Số sao được chọn:', numberOfStars);
  });
});

// danh gia skill 1

const allStar1 = document.querySelectorAll('.rating1 .star1');
const ratingValue1 = document.querySelector('.rating1 input');

allStar1.forEach((item, idx) => {
  item.addEventListener('click', function () {
    let click = 0;
    const numberOfStars1 = idx + 1;

    ratingValue1.value = numberOfStars1;

    allStar1.forEach((i) => {
      i.classList.replace('bxs-star', 'bx-star');
      i.classList.remove('active');
    });

    for (let i = 0; i < allStar1.length; i++) {
      if (i <= idx) {
        allStar1[i].classList.replace('bx-star', 'bxs-star');
        allStar1[i].classList.add('active');
      } else {
        allStar1[i].style.setProperty('--i', click);
        click++;
      }
    }

    console.log('Số sao skill 1 được chọn:', numberOfStars1);
  });
});

// danh gia skill 2

const allStar2 = document.querySelectorAll('.rating2 .star2');
const ratingValue2 = document.querySelector('.rating2 input');

allStar2.forEach((item, idx) => {
  item.addEventListener('click', function () {
    let click = 0;
    const numberOfStars2 = idx + 1;

    ratingValue2.value = numberOfStars2;

    allStar2.forEach((i) => {
      i.classList.replace('bxs-star', 'bx-star');
      i.classList.remove('active');
    });

    for (let i = 0; i < allStar2.length; i++) {
      if (i <= idx) {
        allStar2[i].classList.replace('bx-star', 'bxs-star');
        allStar2[i].classList.add('active');
      } else {
        allStar2[i].style.setProperty('--i', click);
        click++;
      }
    }

    console.log('Số sao skill 2 được chọn:', numberOfStars2);
  });
});

// danh gia skill 2

const allStar3 = document.querySelectorAll('.rating3 .star3');
const ratingValue3 = document.querySelector('.rating3 input');

allStar3.forEach((item, idx) => {
  item.addEventListener('click', function () {
    let click = 0;
    const numberOfStars3 = idx + 1;
    ratingValue3.value = numberOfStars3;
    
    

    allStar3.forEach((i) => {
      i.classList.replace('bxs-star', 'bx-star');
      i.classList.remove('active');
    });

    for (let i = 0; i < allStar3.length; i++) {
      if (i <= idx) {
        allStar3[i].classList.replace('bx-star', 'bxs-star');
        allStar3[i].classList.add('active');
      } else {
        allStar3[i].style.setProperty('--i', click);
        click++;
      }
    }

    console.log('Số sao skill 3 được chọn:', numberOfStars3);
  });
});
