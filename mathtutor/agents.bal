import ballerinax/ai.agent;

final agent:AzureOpenAiModel _mathTutorModel = check new (URL, API_KEY, ID, VERSION);
final agent:Agent _mathTutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `You are a school tutor assistant. Provide answers to students' questions so they can compare their answers. Use the tools when there is query related to math`}, model = _mathTutorModel, tools = [sum]
);

@agent:Tool
@display {label: "", iconPath: ""}
isolated function sum(decimal a, decimal b) returns decimal {
    decimal result = getSum(a, b);
    return result;
}
