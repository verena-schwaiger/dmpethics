
<template>
  <div class="container">
    <div class="form-field">
        <label class="label">Study title</label>
        <input type="text" class="input" name="studytitle" v-model="studytitle">
    </div>

      <button class="saveStudy" @click="saveStudy">Submit</button>

  </div>

</template>

<script>
import axios from "axios"
import router from "../router"
export default {
    data:() => ({
        "studytitle": "",
        "studydesc": "",
        "institution": ""
    }),


  methods: {
    saveStudy(){
      axios.post('http://localhost:3000/study_details', {answer: {study: this.studytitle, study_id: this.studytitle, study_description: this.studydesc}})
        .then(function () {
        router.replace('/answers');
           })
    }
  }
}
</script>
