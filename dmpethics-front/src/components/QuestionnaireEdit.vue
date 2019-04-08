<!-- Renders questionnaire from question data in JSON format. Submitting the form saves answers in the database and redirects to the list of existing studies.-->
<template>
  <div class="container">
    <tree :question-data="this.questions.questiondata"></tree>
    <button class="submitQuestionnaire" @click="saveAnswer">Update</button>
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
    data(){ return {"studytitle": '',
    "questions": Object
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
        }
    } 
};
</script>