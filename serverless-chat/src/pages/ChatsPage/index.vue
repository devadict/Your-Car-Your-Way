<template>
    <div style="height: 100vh">
      <PrettyChatWindow
        :projectId="projectId"
        :username="username"
        :secret="secret"
      />
    </div>
  </template>
  
  <style>
  .ce-new-chat-button {
    width: 32px;
    position: relative;
    bottom: 22px;
  }
  </style>
  
  <script>
  import { PrettyChatWindow } from "react-chat-engine-pretty";
  import { applyReactInVue } from "veaury";
  
  export default {
    data() {
      return {
        projectId: 'c0dee948-c28d-45fc-b713-81184c34900e',
      };
    },
    components: {
      PrettyChatWindow: applyReactInVue(PrettyChatWindow),
    },
    props: {
      username: {
        type: String,
        required: true,
      },
      secret: {
        type: String,
        required: true,
      },
    },
  };
  </script>