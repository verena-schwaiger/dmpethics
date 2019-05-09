<template>
  <div>
    {{answerData}}
    <questionnaire-node-tree :questionData="answerData"></questionnaire-node-tree>
  </div>
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
