import axios from "axios";

const loginRest = async (username, secret) => {
  return await axios.get("https://api.chatengine.io/users/me/", {
    headers: {
      "Project-ID": "c0dee948-c28d-45fc-b713-81184c34900e",
      "User-Name": username,
      "User-Secret": secret,
    },
  });
};

const signupRest= async (username, secret) => {
    return await axios.get("https://api.chatengine.io/users/me/", {
      headers: {
        "Project-ID": "c0dee948-c28d-45fc-b713-81184c34900e",
        "User-Name": username,
        "User-Secret": secret,
      },
    });
};

export { loginRest, signupRest };