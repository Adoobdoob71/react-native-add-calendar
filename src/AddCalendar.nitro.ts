import type { HybridObject } from 'react-native-nitro-modules';

export interface NewEvent {
  title: string;
  location: string;
  startDate: number;
  endDate: number;
  description: string;
  url: string;
}

export interface AddCalendar
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  addEvent(newEvent: NewEvent): Promise<boolean>;
}
