RfpQuestion.create!([
  {rfp_section_id: 1, question: "Organization", question_type: "single input"},
  {rfp_section_id: 1, question: "Address", question_type: "single input"},
  {rfp_section_id: 1, question: "Phone", question_type: "single input"},
  {rfp_section_id: 1, question: "Executive Director", question_type: "single input"},
  {rfp_section_id: 1, question: "Executive Director Phone", question_type: "single input"},
  {rfp_section_id: 1, question: "Executive Director Email", question_type: "single input"},
  {rfp_section_id: 1, question: "Proposal Contact (and title)", question_type: "single input"},
  {rfp_section_id: 1, question: "Proposal Contact Email", question_type: "single input"},
  {rfp_section_id: 2, question: "Number of employees (full & part-time)", question_type: "single input"},
  {rfp_section_id: 2, question: "Number of volunteers", question_type: "single input"},
  {rfp_section_id: 2, question: "Number of active board members", question_type: "single input"},
  {rfp_section_id: 2, question: "Total organization budget for most recent fiscal year", question_type: "single input"},
  {rfp_section_id: 3, question: "Please list all programs your organization runs. Add more lines as needed", question_type: "multiple input"},
  {rfp_section_id: 3, question: "Please your largest program", question_type: "block"},
  {rfp_section_id: 3, question: "Please your second largest program", question_type: "block"},
  {rfp_section_id: 3, question: "Also please describe the evolution of the programs/services offered. Are there any key offerings that have been discontinued and why?", question_type: "single input"},
  {rfp_section_id: 4, question: "Indicate the extent to which your program(s) and/or services possess any of the following attributes: (a) have potential for increasing the numbers served; (b) can create leverage by spreading of innovative program model; and/or (c) is scalable/replicable in other locations and/or organizations", question_type: "single input"},
  {rfp_section_id: 5, question: "Provide a brief summary of your organization's history. Use seven sentences or less", question_type: "single input"},
  {rfp_section_id: 6, question: "Describe your organization's top priorities and goals, both short term (over the next year) and long term (over three to five years).", question_type: "single input"},
  {rfp_section_id: 7, question: "What are your capacity building needs (short- and  long-term)? What will you need to strengthen or develop at the organization level in order to achieve your organization's current and future goals and objectives?", question_type: "single input"},
  {rfp_section_id: 7, question: "Where could you use SVP Chicago's Partners' expertise and consulting resources to assist you in your capacity building efforts? List and explain at least three to five potential projects with which you would like SVP Chicago to assist and briefly describe how this assistance will help you improve your operations.", question_type: "single input"},
  {rfp_section_id: 7, question: "Please describe any current capacity-building activities in which you are already engaged through the help of outside consultants or funders.", question_type: "single input"},
  {rfp_section_id: 8, question: "How will you know when you have accomplished your mission and program goals? What are your indicators of success and how do you measure them? If you have quantifiable, evaluative data, please list it.", question_type: "single input"},
  {rfp_section_id: 9, question: "Please list your senior leadership team. ", question_type: "block with multiple inputs"},
  {rfp_section_id: 9, question: "Are there are significant leadership changes or role shifts planned?", question_type: "single input"},
  {rfp_section_id: 9, question: "How will the organizational leadership and board ensure the success of its relationship with SVP Chicago?", question_type: "single input"},
  {rfp_section_id: 10, question: "Please list your board members, with brief descriptions of their background and number of years served. Indicate if any board member is receiving compensation from the organization.", question_type: "block with multiple inputs"},
  {rfp_section_id: 10, question: "How many board meetings do you have yearly", question_type: "single input"},
  {rfp_section_id: 10, question: "What percentage of board members donated money in the last 12 months?", question_type: "single input"},
  {rfp_section_id: 10, question: "What percentage of your board members are active? Please also define how you measure what constitutes an active board member?", question_type: "single input"},
  {rfp_section_id: 11, question: "Please indicate the following for the current fiscal year and three previous years:", question_type: "block with multiple inputs"},
  {rfp_section_id: 11, question: "How frequently does your board review your financial statements and comparisons to budget?", question_type: "single input"},
  {rfp_section_id: 11, question: "For the current fiscal year, are your revenues meeting budgeted expectations", question_type: "single input"},
  {rfp_section_id: 11, question: "For the current fiscal year, is your spending within budget", question_type: "single input"},
  {rfp_section_id: 11, question: "What is the allocation of your current sources of funding (by %)", question_type: "single input"},
  {rfp_section_id: 11, question: "Donations", question_type: "single input"},
  {rfp_section_id: 11, question: "Grants", question_type: "single input"},
  {rfp_section_id: 11, question: "Generated Revenue", question_type: "single input"},
  {rfp_section_id: 11, question: "Describe your anticipated funding for this year and future years.", question_type: "single input"},
  {rfp_section_id: 11, question: "Describe how you propose using the initial, first year investment of $25,000 you would receive from SVP Chicago.", question_type: "single input"},
  {rfp_section_id: 12, question: "What local and national affiliations do you have?", question_type: "single input"},
  {rfp_section_id: 12, question: "How are you leveraging partners and networks in the Chicagoland area to enhance the services you provide?", question_type: "single input"},
  {rfp_section_id: 12, question: "Which are national or parent organizations? What are your responsibilities to these organizations?", question_type: "single input"},
  {rfp_section_id: 12, question: "If affiliated with a national or parent organization, describe the roles you each play in the following:", question_type: "block"},
  {rfp_section_id: 13, question: "Please describe any current, anticipated, or past civil, criminal, legal or regulatory issues, violations, lawsuits, or claims against the organization or any personnel.", question_type: "single input"}
])
SubQuestion.create!([
  {rfp_question_id: 14, question: "Program Title"},
  {rfp_question_id: 14, question: "What Issue or Need Does This Program Try to Address"},
  {rfp_question_id: 14, question: "Area Served"},
  {rfp_question_id: 14, question: "Current Number Served"},
  {rfp_question_id: 14, question: "What is particularly effective about this program"},
  {rfp_question_id: 14, question: "Short Program Description"},
  {rfp_question_id: 14, question: "Target Population"},
  {rfp_question_id: 14, question: "What is the Unique focus of this program"},
  {rfp_question_id: 14, question: "Ages Served"},
  {rfp_question_id: 15, question: "Program Title"},
  {rfp_question_id: 15, question: "What Issue or Need Does This Program Try to Address"},
  {rfp_question_id: 15, question: "Area Served"},
  {rfp_question_id: 15, question: "Current Number Served"},
  {rfp_question_id: 15, question: "What is particularly effective about this program"},
  {rfp_question_id: 15, question: "Short Program Description"},
  {rfp_question_id: 15, question: "Target Population"},
  {rfp_question_id: 15, question: "What is the Unique focus of this program"},
  {rfp_question_id: 15, question: "Ages Served"},
  {rfp_question_id: 26, question: "Board Member"},
  {rfp_question_id: 30, question: "Fiscal year ended"},
  {rfp_question_id: 23, question: "Name"},
  {rfp_question_id: 26, question: "Background, Responsibilites and Years served"},
  {rfp_question_id: 30, question: "Revenues"},
  {rfp_question_id: 30, question: "Expenditures"},
  {rfp_question_id: 23, question: "Title and Biography"}
])
