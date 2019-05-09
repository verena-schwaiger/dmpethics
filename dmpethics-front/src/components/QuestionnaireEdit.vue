<!-- Renders questionnaire from question data in JSON format. Submitting the form saves answers in the database and redirects to the list of existing studies.-->
<template>
  <div class="container">
    <tree :question-data="this.questions.questiondata"></tree>
    <div v-show="!loading">
        <button class="submitQuestionnaire" @click="saveAnswer">Update</button>
    </div>   
    <div v-show="loading">
      <img src="@/assets/loading.gif" width="70px" height="35px">
    </div>    
    <div v-show="submitted">
      <p>Successfully submitted!</p>
    </div> 
    <!-- Errors point to network problems. -->
    <div v-show="error">
      <p>Error while submitting. Please reload the page and try again.</p>
    </div> 
</div>
</template>

<script>
import Tree from "./Tree";
import axios from "axios";

export default {
    name: "QuestionnaireTest",
    props: {
    answerData: Object
    },
    data(){ 
        return {
        studytitle: this.answerData.study,
        questions: Object,
        submitted: false,
        error: false,
        loading: false
    }
    },
    components: {
        Tree
    },
    mounted() {
        this.questions = JSON.parse(this.answerData.data);
    },
    methods: {
        saveAnswer(){
            this.loading = true;
            axios.put('http://localhost:3000/answers/'+this.answerData.id+'/', {answer: {study: this.studytitle, data: JSON.stringify(this.questions)}})
            .then(response => {
                if(response.status === 200){
                    this.submitted = true;
                    this.loading = false;
                }
                else{
                    this.error = true;
                    this.loading = false;
                }
            })
        }
    } 
};
</script>