import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Votre assistant personnalisé", "Votre coach comptable", "A votre service"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
