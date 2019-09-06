import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["MAE mon auto-entreprise", "Mae compta", "Mon coach administratif"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
