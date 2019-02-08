<template>
  <div class="container">
    <div v-for="(question,index) in questions" :key="index">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" v-model="question.checked" :id="index">
        <label :for="index" class="form-check-label">{{ question.text }}</label>
      </div>
      <transition name="fade">
        <div v-if="question.checked">
          <div v-for="(subquestion, subindex) in question.subQuestions" :key="subindex">
            <div>Test</div>
          </div>
          <div class="alert alert-warning" role="alert">A simple warning alert—check it out!</div>
        </div>
      </transition>
    </div>
    <button class="btn btn-primary" @click="createQuestion">Create</button>
  </div>
</template>

  <div class="container">
    <div v-for="(question,index) in questions" :key="index">
      <div class="question">
        <input type="checkbox" class="form-check-input" v-model="question.checked" :id="index">
        <label :for="index" class="form-check-label">{{ question.label }}</label>
        <div class="box">
            <div v-if="question.checked" class="warning">
                {{ question.comment }}
            </div>
        </div>
      </div>
      <div v-if="question.checked">
        <div v-for="(child, subindex) in question.children" :key="subindex" class="subquestion">
          <input type="checkbox" class="form-check-input" v-model="child.checked" :id="subindex">
          <label :for="index" class="form-check-label">{{ child.label }}</label>
                  <div class="box">
                      <div v-if="child.checked" class="warning">
                          {{ child.comment }}
                      </div>
                  </div>
        </div>
      </div>
    </div>
  </div>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      questions: [
        {
          text: "Question 1",
          checked: false,
          comment: "This is madness",
          subQuestions: [
            {
              text: "Subquestion 1"
            }
          ]
        },
        {
          text: "Question 2231",
          checked: false,
          subQuestions: [
            {
              text: "Subquestion 2"
            }
          ]
        }
      ]
    };
  },
  props: {
    msg: String
  },
  methods: {
    createQuestion() {
      this.questions.push({
        text: "New",
        checked: false
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: all 0.5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>


<script>
import Tree from "./Tree";

let questionlist =               {label: "root",
                                "children": [
                                   {
                                     "id": "A",
                                     "checked": false,
                                     "category": "A",
                                     "label": "Are human participants involved?",
                                     "comment": "Need informed consent",
                                     "children": [
                                       {
                                         "id": "A00001",
                                         "checked": false,
                                         "category": "A",
                                         "label": "Are minors involved?",
                                         "comment": "Need parental consent",
                                         "children": [
                                           {
                                             "id": "A00003",
                                             "checked": false,
                                             "category": "A",
                                             "label": "Are any involved minors wards of the state?",
                                             "comment": "An advocate must be organized.",
                                             "children": [

                                             ]
                                           }

                                         ]
                                       },
                                       {
                                         "id": "A00002",
                                         "checked": false,
                                         "category": "A",
                                         "label": "Are pregnant women involved?",
                                         "comment": "",
                                         "children": [

                                         ]
                                       },
                                       {
                                         "id": "A00004",
                                         "checked": false,
                                         "category": "A",
                                         "label": "Are prisoners involved?",
                                         "comment": "Need informed consent",
                                         "children": [

                                         ]
                                       },
                                       {
                                         "id": "A00005",
                                         "checked": false,
                                         "category": "A",
                                         "label": "Are participants involved who aren't native speakers of your study's language?",
                                         "comment": "Study details should be easy to understand.",
                                         "children": [

                                         ]
                                       },
                                       {
                                         "id": "A00006",
                                         "checked": false,
                                         "category": "A",
                                         "label": "Are any illiterate participants involved?",
                                         "comment": "",
                                         "children": [

                                         ]
                                       },
                                      {
                                        "id": "A00007",
                                        "checked": false,
                                        "category": "A",
                                        "label": "Are psychologically vulnerable participants involved?",
                                        "comment": "",
                                        "children": [

                                        ]
                                      },
                                    {
                                      "id": "A00008",
                                      "checked": false,
                                      "category": "A",
                                      "label": "Are any of the researchers a study subject themselves?",
                                      "comment": "",
                                      "children": [

                                      ]
                                    },
                                      {
                                        "id": "A00009",
                                        "checked": false,
                                        "category": "A",
                                        "label": "Is there any risk of psychological or physical harm for participants?",
                                        "comment": "",
                                        "children": [

                                        ]
                                      },
                                    {
                                      "id": "A00010",
                                      "checked": false,
                                      "category": "A",
                                      "label": "Are there any potential gatekeepers, such as schools or nursing homes?",
                                      "comment": "Get permission from the gatekeepers.",
                                      "children": [

                                      ]
                                    },
                                      {
                                        "id": "A00011",
                                        "checked": false,
                                        "category": "A",
                                        "label": "Do participants have knowledge of observation and data collection?",
                                        "comment": "",
                                        "children": [

                                        ]
                                      }
                                       ]
                                   },

                                   {
                                     "id": "B",
                                     "checked": false,
                                     "category": "B",
                                     "label": "Are animals involved?",
                                     "comment": "",
                                     "children": [
                                         {
                                           "id": "B00001",
                                           "checked": false,
                                           "category": "B",
                                           "label": "Are the animals vertrebrates?",
                                           "comment": "",
                                           "children": [
                                           ]
                                         },
                                         {
                                           "id": "B00002",
                                           "checked": false,
                                           "category": "B",
                                           "label": "Are the animals non-vertrebrates?",
                                           "comment": "",
                                           "children": [
                                           ]
                                         },
                                         {
                                           "id": "B00003",
                                           "checked": false,
                                           "category": "B",
                                           "label": "Are the animals cephalopods?",
                                           "comment": "",
                                           "children": [
                                           ]
                                         }
                                     ]
                                   },

                                 {
                                   "id": "D",
                                   "checked": false,
                                   "category": "D",
                                   "label": "Does your study involve the environment, fieldwork, or existing structures or monuments?",
                                   "comment": "",
                                   "children": [
                                         {
                                           "id": "D00001",
                                           "checked": false,
                                           "category": "D",
                                           "label": "Could there be potential risk for the environment?",
                                           "comment": "Detail the potentical risks in your application.",
                                           "children": [
                                           ]
                                         },
                                       {
                                         "id": "D00002",
                                         "checked": false,
                                         "category": "D",
                                         "label": "Does your study involve work on existing monuments?",
                                         "comment": "Get permission from the parties responsible for the monument.",
                                         "children": [
                                             {
                                               "id": "D00004",
                                               "checked": false,
                                               "category": "D",
                                               "label": "Is there any form of altering or potentially damaging a monument involved?",
                                               "comment": "",
                                               "children": [
                                               ]
                                             }
                                         ]
                                       },
                                         {
                                           "id": "D00003",
                                           "checked": false,
                                           "category": "D",
                                           "label": "Will your study take place on private property?",
                                           "comment": "Get permission and consent from the owner.",
                                           "children": [
                                           ]
                                         },

                                   ]
                                 },
                               {
                                 "id": "C",
                                 "checked": false,
                                 "category": "C",
                                 "label": "Check",
                                 "comment": "",
                                 "children": [
                                 {
                                   "id": "C00001",
                                   "checked": false,
                                   "category": "C",
                                   "label": "Are you, the researcher, a student?",
                                   "comment": "The application form will require your supervisor's signature.",
                                   "children": [
                                   ]
                                 },
                                 {
                                   "id": "C00002",
                                   "checked": false,
                                   "category": "C",
                                   "label": "Do you collect data outside the country where you will apply for ethics approval?",
                                   "comment": "Consult w.r.t. safety guidelines for travelling and fieldwork.",
                                   "children": [
                                   ]
                                 },
                                 {
                                   "id": "C00003",
                                   "checked": false,
                                   "category": "C",
                                   "label": "Will the fieldwork in that country come with specific physical or psychological risks for involved researchers?",
                                   "comment": "",
                                   "children": [
                                   ]
                                 },
                                 {
                                   "id": "C00004",
                                   "checked": false,
                                   "category": "C",
                                   "label": "Is your institution not the only institution involved in any way or form?",
                                   "comment": "Collect approval from all involved institutions.",
                                   "children": [
                                   ]
                                 },
                                 {
                                   "id": "C00005",
                                   "checked": false,
                                   "category": "C",
                                   "label": "Could your study results be misused, for example for military purposes?",
                                   "comment": "",
                                   "children": [
                                   ]
                                 },
                                 ]
                               }



                                 ]

                           }


export default {
  name: "Questionnaire",
  data() {
    return {
              "questions": [
                {
                  "id": "A",
                  "checked": false,
                  "category": "A",
                  "label": "Are human participants involved?",
                  "comment": "Need informed consent",
                  "children": [
                    {
                      "id": "A00001",
                      "checked": false,
                      "category": "A",
                      "label": "Are minors involved?",
                      "comment": "Need parental consent",
                      "children": [
                        {
                          "id": "A00003",
                          "checked": false,
                          "category": "A",
                          "label": "Are any involved minors wards of the state?",
                          "comment": "An advocate must be organized.",
                          "children": [

                          ]
                        }

                      ]
                    },
                    {
                      "id": "A00002",
                      "checked": false,
                      "category": "A",
                      "label": "Are pregnant women involved?",
                      "comment": "",
                      "children": [

                      ]
                    },
                    {
                      "id": "A00004",
                      "checked": false,
                      "category": "A",
                      "label": "Are prisoners involved?",
                      "comment": "Need informed consent",
                      "children": [

                      ]
                    },
                    {
                      "id": "A00005",
                      "checked": false,
                      "category": "A",
                      "label": "Are participants involved who aren't native speakers of your study's language?",
                      "comment": "Study details should be easy to understand.",
                      "children": [

                      ]
                    },
                    {
                      "id": "A00006",
                      "checked": false,
                      "category": "A",
                      "label": "Are any illiterate participants involved?",
                      "comment": "",
                      "children": [

                      ]
                    },
                   {
                     "id": "A00007",
                     "checked": false,
                     "category": "A",
                     "label": "Are psychologically vulnerable participants involved?",
                     "comment": "",
                     "children": [

                     ]
                   },
                 {
                   "id": "A00008",
                   "checked": false,
                   "category": "A",
                   "label": "Are any of the researchers a study subject themselves?",
                   "comment": "",
                   "children": [

                   ]
                 },
                   {
                     "id": "A00009",
                     "checked": false,
                     "category": "A",
                     "label": "Is there any risk of psychological or physical harm for participants?",
                     "comment": "",
                     "children": [

                     ]
                   },
                 {
                   "id": "A00010",
                   "checked": false,
                   "category": "A",
                   "label": "Are there any potential gatekeepers, such as schools or nursing homes?",
                   "comment": "Get permission from the gatekeepers.",
                   "children": [

                   ]
                 },
                   {
                     "id": "A00011",
                     "checked": false,
                     "category": "A",
                     "label": "Do participants have knowledge of observation and data collection?",
                     "comment": "",
                     "children": [

                     ]
                   }
                    ]
                },

                {
                  "id": "B",
                  "checked": false,
                  "category": "B",
                  "label": "Are animals involved?",
                  "comment": "",
                  "children": [
                      {
                        "id": "B00001",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals vertrebrates?",
                        "comment": "",
                        "children": [
                        ]
                      },
                      {
                        "id": "B00002",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals non-vertrebrates?",
                        "comment": "",
                        "children": [
                        ]
                      },
                      {
                        "id": "B00003",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals cephalopods?",
                        "comment": "",
                        "children": [
                        ]
                      }
                  ]
                },

              {
                "id": "D",
                "checked": false,
                "category": "D",
                "label": "Does your study involve the environment, fieldwork, or existing structures or monuments?",
                "comment": "",
                "children": [
                      {
                        "id": "D00001",
                        "checked": false,
                        "category": "D",
                        "label": "Could there be potential risk for the environment?",
                        "comment": "Detail the potentical risks in your application.",
                        "children": [
                        ]
                      },
                    {
                      "id": "D00002",
                      "checked": false,
                      "category": "D",
                      "label": "Does your study involve work on existing monuments?",
                      "comment": "Get permission from the parties responsible for the monument.",
                      "children": [
                          {
                            "id": "D00004",
                            "checked": false,
                            "category": "D",
                            "label": "Is there any form of altering or potentially damaging a monument involved?",
                            "comment": "",
                            "children": [
                            ]
                          }
                      ]
                    },
                      {
                        "id": "D00003",
                        "checked": false,
                        "category": "D",
                        "label": "Will your study take place on private property?",
                        "comment": "Get permission and consent from the owner.",
                        "children": [
                        ]
                      },

                ]
              },
            {
              "id": "C",
              "checked": false,
              "category": "C",
              "label": "Check",
              "comment": "",
              "children": [
              {
                "id": "C00001",
                "checked": false,
                "category": "C",
                "label": "Are you, the researcher, a student?",
                "comment": "The application form will require your supervisor's signature.",
                "children": [
                ]
              },
              {
                "id": "C00002",
                "checked": false,
                "category": "C",
                "label": "Do you collect data outside the country where you will apply for ethics approval?",
                "comment": "Consult w.r.t. safety guidelines for travelling and fieldwork.",
                "children": [
                ]
              },
              {
                "id": "C00003",
                "checked": false,
                "category": "C",
                "label": "Will the fieldwork in that country come with specific physical or psychological risks for involved researchers?",
                "comment": "",
                "children": [
                ]
              },
              {
                "id": "C00004",
                "checked": false,
                "category": "C",
                "label": "Is your institution not the only institution involved in any way or form?",
                "comment": "Collect approval from all involved institutions.",
                "children": [
                ]
              },
              {
                "id": "C00005",
                "checked": false,
                "category": "C",
                "label": "Could your study results be misused, for example for military purposes?",
                "comment": "",
                "children": [
                ]
              },
              ]
            }



              ]

        };
  },
  props: {
    msg: String
  },
    components: {
      Tree
    },
  methods: {
    createQuestion() {
      this.questions.push({
        text: "New",
        checked: false
      });
    }
  }
};
</script>

<style scoped>
p {
    font-size: 2em;
    text-align: center;
}

</style>

