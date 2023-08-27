<template>
    <div class="login-page">
        <div>
            <img src="../../assets/banner.png" alt="">
        </div>
      <div class="card">
          <button type="submit" @click="login">Client</button>
          <button type="submit" @click="signup">Support</button>
      </div>
    </div>
  </template>
  
  <script>
  import { loginRest, signupRest } from "./apis";
  
  export default {
    methods: {
      login() {
        loginRest("client", "Open_1234")
          .then((response) =>
            this.$emit("onAuth", { ...response.data, secret: "Open_1234" })
          )
          .catch((error) => console.log("Login error", error));
      },
        signup() {
            loginRest("support", "Open_1234")
          .then((response) =>
            this.$emit("onAuth", { ...response.data, secret: "Open_1234" })
          )
          .catch((error) => console.log("Login error", error));
      },
    },
  };
  </script>

  <style scoped>
  img {
    width: 500px;
    margin-right: 7em;
    align-self: center;
    padding-left: 33em;
    padding-top: 5em;
  }
  </style>