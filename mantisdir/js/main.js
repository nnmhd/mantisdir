const app = Vue.createApp({
  created() {
    fetch("http://localhost:8888/mantisdir/mantisdir_API/public/mantis")
      .then((response) => response.json())
      .then((data) => {
        this.mantis = data;
        this.isLoading = false;
        console.log(this.mantis.subspecies);
      })
      .catch((err) => console.error(err));
  },
  data() {
    return {
      mantis: [],
      continent: "",
      isLoading: true,
      selectedMantis: null,
      error: "",
    };
  },
  methods: {
    getMantis(id) {
      fetch(`http://localhost:8888/mantisdir/mantisdir_API/public/mantis/${id}`)
        .then((response) => response.json())
        .then((data) => {
          console.log(`clicked ${id}`);
          this.isLoading = false;
          if (data.length > 0) {
            this.selectedMantis = data[0];
            this.error = "";
          } else {
            this.name = [];
            this.error = "No data found";
          }
        })
        .catch((err) => console.error(err));
    },
  },
}).mount("#app");
