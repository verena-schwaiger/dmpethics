<template>
  <p>
    <questionnaire-node-tree :questionData="answerData"></questionnaire-node-tree>
  </p>
</template>

<script>
import QuestionnaireNodeTree from "./QuestionnaireNodeTree";

export default {
  props: {
    answerData: Object
  },
  components: {
    QuestionnaireNodeTree
  }
};
</script>
