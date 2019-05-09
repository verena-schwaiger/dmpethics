<!-- Renders questionnaire from question data in JSON format. Submitting the form saves answers in the database and redirects to the list of existing studies.-->
<template>
  <div class="container">
    <div class="form-field">
        <label class="form-label">Study title</label>
        <input type="text" class="input" name="studytitle" v-model="studytitle">
    </div>
    <h3>Study details</h3>
    <tree :question-data="questions.questiondata"></tree>
    <button class="submitQuestionnaire" @click="saveAnswer">Submit</button>
</div>
</template>

<script>
import Tree from "./Tree";
import axios from "axios";
import router from "../router"
import questiondata from "../files/questions.json"

export default {
  name: "Questionnaire",
  data: () => ({ "studytitle": '',
  "questions":{
    questiondata
        }}),
  components: {
    Tree
  },
  methods: {
    saveAnswer(){
      axios.post('http://localhost:3000/answers', {answer: {study: this.studytitle, data: JSON.stringify(this.questions)}})
        .then(function () {
        router.replace('/answers');
           })    
    }
  }
};
</script>