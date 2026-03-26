import { NitroModules } from 'react-native-nitro-modules';
import type { AddCalendar, NewEvent } from './AddCalendar.nitro';

const AddCalendarHybridObject =
  NitroModules.createHybridObject<AddCalendar>('AddCalendar');

export function addEvent({
  title,
  location,
  startDate,
  endDate,
  description,
  url,
}: NewEvent): Promise<boolean> {
  return AddCalendarHybridObject.addEvent({
    title,
    location,
    startDate,
    endDate,
    description,
    url,
  });
}
