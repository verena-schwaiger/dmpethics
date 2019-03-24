
<template>
  <div class="container">
    <!--<div class="form-field">
        <label class="label">First name</label>
        <input type="text" class="input" name="firstname" v-model="firstname">
    </div>
    <div class="form-field">
        <label class="label">Surname</label>
        <input type="text" class="input" name="surname" v-model="surname">
    </div>
    <div class="form-field">
        <label class="label">E-Mail Address</label>
        <input type="text" class="input" name="email" v-model="email">
    </div>
    <div class="form-field">
        <label class="label">Password</label>
        <input type="text" class="input" name="password" v-model="password">
    </div>

    <tree :question-data="questions"></tree>
      <button class="submitUser" @click="saveUser">Submit</button>
-->
<p>{{firstname}} {{surname}}</p>
<p>{{email}}</p>
  </div>

</template>

<script>
import axios from "axios"
import router from "../router"
export default {
    data:() => ({
        "firstname": "",
        "surname": "",
        "email": "",
        "password": "",
    }),
    mounted () {
            axios.get('http://localhost:3000/users/')
            .then(response => (this.firstname = response.data[0].user_firstname, this.surname = response.data[0].user_surname, this.email = response.data[0].user_email))
    },
    methods: {
        saveUser(){
        axios.post('http://localhost:3000/users', {answer: {user_firstname: this.firstname, user_surname: this.surname, user_email: this.email, user_password: this.password}})
            .then(function () {
            router.replace('/answers');
            })
        }
    }
}
</script>
