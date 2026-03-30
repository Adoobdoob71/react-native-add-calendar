import type { HybridObject } from 'react-native-nitro-modules';

export interface NewEvent {
  /**
   * Title of the event
   */
  title: string;
  /**
   * String representing the location of the event, optional
   */
  location?: string;
  /**
   * Start time of the event, in milliseconds
   * @example 1773759222723
   */
  startDate: number;
  /**
   * End time of the event, in milliseconds
   * @example 1773999600000
   */
  endDate: number;
  /**
   * Description of the event
   */
  description: string;
  /**
   * Url for the event, optional
   */
  url?: string;
}

export interface AddCalendar
  extends HybridObject<{ ios: 'swift'; android: 'kotlin' }> {
  addEvent(newEvent: NewEvent): Promise<boolean>;
}
