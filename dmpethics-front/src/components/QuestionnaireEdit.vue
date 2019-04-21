<!-- Renders questionnaire from question data in JSON format. Submitting the form saves answers in the database and redirects to the list of existing studies.-->
<template>
  <div class="container">
    <tree :question-data="this.questions.questiondata"></tree>
    <div v-show="submitted">
      <p>Successfully submitted!</p>
    </div> 
    <div v-show="!submitted">
        <button class="submitQuestionnaire" @click="saveAnswer">Update</button>
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
    data(){ return {
        studytitle: this.answerData.study,
        questions: Object,
        submitted: false,
        error: false
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
            axios.put('http://localhost:3000/answers/'+this.answerData.id+'/', {answer: {study: this.studytitle, data: JSON.stringify(this.questions)}})
            .then(response => {
                if(response.status === 200){
                    this.submitted = true;
                }
                else{
                    this.error = true;
                }
            })
        }
    } 
};
</script>