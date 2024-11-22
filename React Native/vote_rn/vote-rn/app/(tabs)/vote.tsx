import { useState } from "react";
import { Button, Text, View, ViewComponent } from "react-native";

export default function VoteScreen() {
    const [poll, setPoll] = useState(pollData)
    const [winnerAnnounced, setWinnerAnnounced] = useState(false);
    return (
        <View style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
            <Text>{poll.question}</Text>
            <VoteComponent poll={poll} winnerAnnounced={winnerAnnounced} onPress={(optionId) => {
                const newPoll: Poll = {
                    ...poll,
                    options: poll.options.map((option) => option.id !== optionId ?
                     option : {...option, votes: option.votes + 1})             
                }
                setPoll(newPoll)
            }}></VoteComponent>
            <ResultComponent poll={poll} winnerAnnounced={winnerAnnounced} onPressViewWinner={()=>{
                setWinnerAnnounced(true)
            }}/>
        </View>
    );
}

function VoteComponent({ poll, winnerAnnounced, onPress }: {poll: Poll, onPress: (optionId: number)=>void, winnerAnnounced: boolean}) {
    return (
        <View style={{flexDirection: 'row'}}>
            {poll.options.map((option)=>{
                return <Button disabled={winnerAnnounced} title={option.text} onPress={()=>{
                    onPress(option.id)
                }}></Button>
            })}
        </View>
    )
}

function ResultComponent({poll, winnerAnnounced, onPressViewWinner}:{poll: Poll, winnerAnnounced: boolean, onPressViewWinner: ()=>void}) {
    
    const [superman, batman] = poll.options
    const isTie = superman.votes == batman.votes

    const {leading, other} = superman.votes > batman.votes 
    ? {leading: superman, other: batman} 
    : {leading: batman, other: superman}

    const voteDifference = leading.votes - other.votes
    
    const text = isTie ? `It's a tie` 
    : winnerAnnounced 
    ? `${leading.text} won by ${leading.votes-other.votes} votes`
    : `${leading.text} is leading by ${leading.votes-other.votes} votes`
    const tieText = `It's a tie`
    const leadingText = `${leading.text} is leading by ${voteDifference}s`
    const announcedWinnerText = `${leading.text} won by ${voteDifference} votes`

    return (
        <View>
            <Text style={{textAlign: 'center'}}>{text}</Text>
            <Button disabled={winnerAnnounced} title="View winner" onPress={onPressViewWinner}></Button>
        </View>
    )
}


interface PollOption {
    id: number
    text: string
    votes: number
} 

interface Poll {
    question: string
    options: PollOption[] 
}

const pollData: Poll = {
    question: 'Who is your favorite character?',
    options: [
        { id: 1, text: 'Superman', votes: 0 },
        { id: 2, text: 'Batman', votes: 0 },
    ]
}