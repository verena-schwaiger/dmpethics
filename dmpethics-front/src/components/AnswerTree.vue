<template>
  <div class="container">
      <answer-node-tree :answers="selectedAnswers"></answer-node-tree>
            <button class="submitQuestionnaire" @click="saveAnswer">Submit</button>

  </div>
</template>

<script>
import AnswerNodeTree from "./AnswerNodeTree";

export default {
  props: {
    answerData: Object
  },
  computed:{
   selectedAnswers (){
     return JSON.parse(this.answerData.data)
   }
 },
  components: {
    AnswerNodeTree
  }
};
</script>
