import { View, StyleSheet, Text } from 'react-native';
import { addEvent } from 'react-native-add-calendar';

export default function App() {
  return (
    <View style={styles.container}>
      <Text
        onPress={() =>
          addEvent({
            title: 'Hello world',
            description: 'Somewhere over the rainbow',
            startDate: 1773759222723,
            endDate: 1773999600000,
            location: 'Idk maybe over there',
            url: 'https://github.com/Adoobdoob71',
          })
        }
      >
        Add Event
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
