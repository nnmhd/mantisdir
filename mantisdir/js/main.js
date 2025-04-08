import { GreenSock } from "./gsap.js";
GreenSock();

const app = Vue.createApp({
  data() {
    return {
      mantis: [],
      isLoading: true,
      isLoadingSub: false,
      continent: "",
      selectedMantis: null,
      subspeciesErrorCall: null,
      selectedSubspecies: null,
    };
  },
  created() {
    fetch("http://localhost:8888/mantisdir/mantisdir_API/public/mantis")
      .then((response) => response.json())
      .then((data) => {
        this.mantis = data;
        this.isLoading = false;
      })
      .catch((err) => {
        console.error("Error fetching mantis:", err);
        this.isLoading = false;
      });
  },
  methods: {
    getMantis(id) {
      this.isLoadingSub = true;
      this.subspeciesErrorCall = null;
      const selected = this.mantis.find((item) => item.continental_id === id);
      this.selectedMantis = selected || null;
      this.continent = id;
      this.selectedSubspecies = null;
      fetch(`http://localhost:8888/mantisdir/mantisdir_API/public/mantis/${id}`)
        .then((response) => response.json())
        .then((data) => {
          this.isLoadingSub = false;
          if (data && data.subspecies) {
            this.selectedMantis = {
              ...data,
              img: data.image_path,
              biomes: data.biomes,
            };
          } else {
            this.subspeciesErrorCall = `No subspecies data found for ID: ${id}`;
          }
          const aMantisElement = document.querySelector("#aMantis");
          aMantisElement.classList.add("hidden");
          if (window.innerWidth < 768) {
            const subSpeciesElement = document.querySelector("#sub-species");
            if (subSpeciesElement) {
              subSpeciesElement.classList.remove("hidden");
            }
          }
        })
        .catch((err) => {
          this.isLoadingSub = false;
          this.subspeciesErrorCall =
            "An error occurred while loading subspecies data";
        });
    },
    getLocalSpecie(id) {
      this.isLoadingSub = true;
      this.subspeciesErrorCall = null;

      fetch(
        `http://localhost:8888/mantisdir/mantisdir_API/public/subspecies/${id}`
      )
        .then((response) => response.json())
        .then((data) => {
          this.selectedSubspecies = data;
          this.isLoadingSub = false;
          const subSpeciesElement = document.querySelector("#sub-species");
          if (subSpeciesElement) {
            subSpeciesElement.style.boxShadow = "5px 0 10px rgba(0, 0, 0, 0.2)";
          }
          console.log("Subspecies data:", data);
        })
        .then(() => {
          if (window.innerWidth < 1080) {
            const subSpeciesElement = document.querySelector("#sub-species");
            const aMantisElement = document.querySelector("#aMantis");
            subSpeciesElement.classList.add("hidden");
            aMantisElement.classList.remove("hidden");
          }
        })
        .catch((err) => {
          console.error("Error fetching local subspecies:", err);
          this.isLoadingSub = false;
          this.subspeciesErrorCall =
            "An error occurred while loading local subspecies data";
        });
    },
    backFromMantis() {
      const aMantisElement = document.querySelector("#aMantis");
      const subSpeciesElement = document.querySelector("#sub-species");
      if (aMantisElement) {
        aMantisElement.classList.add("hidden");
      }
      if (subSpeciesElement) {
        subSpeciesElement.classList.remove("hidden");
      }
    },
    backFromSubSpecie() {
      const subSpeciesElement = document.querySelector("#sub-species");
      const aMantisElement = document.querySelector("#aMantis");
      if (subSpeciesElement) {
        subSpeciesElement.classList.add("hidden");
      }
    },
  },
}).mount("#app");
