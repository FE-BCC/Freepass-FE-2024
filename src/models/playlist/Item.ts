import { ExternalUrls } from "@models/ExternalUrls";
import { Image } from "@models/Image";
import { Owner } from "./Owner";
import { Tracks } from "./Tracks";

export interface Item {
  collaborative: boolean;
  description: string;
  external_urls: ExternalUrls;
  href: string;
  id: string;
  images: Image[];
  name: string;
  owner: Owner;
  public: boolean;
  snapshot_id: string;
  tracks: Tracks;
  type: string;
  uri: string;
}
