export function GreenSock() {
  gsap.registerPlugin(ScrollTrigger, ScrollToPlugin);

  const foreword = document.querySelector("#foreword");
  const container = document.querySelector("#display");

  ScrollTrigger.create({
    trigger: foreword,
    start: "center center",
    onEnter: () => {
      console.log("ScrollTrigger fired");
      gsap.fromTo(
        container,
        {
          y: "100vh",
          opacity: 0,
        },
        {
          y: 0,
          opacity: 1,
          duration: 1.2,
          ease: "power4.out",
        }
      );
      gsap.to(foreword, {
        opacity: 0,
        duration: 0.8,
        ease: "power2.inOut",
      });
    },
    markers: true,
  });
}
