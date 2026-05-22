import { Injectable } from '@angular/core';
import { Firestore, collection, collectionData, addDoc, deleteDoc, doc } from '@angular/fire/firestore';
import { Meta } from '../models/meta.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MetaServiceService {

  constructor(private firestore: Firestore) {}

  getMetas(): Observable<Meta[]> {
    const metasRef = collection(this.firestore, 'metas');
    return collectionData(metasRef, { idField: 'id' }) as Observable<Meta[]>;
  }

  addMeta(meta: Meta): Promise<any> {
    const metasRef = collection(this.firestore, 'metas');
    return addDoc(metasRef, { meta: meta.meta });
  }

  deleteMeta(id: string): Promise<void> {
    const metaDoc = doc(this.firestore, `metas/${id}`);
    return deleteDoc(metaDoc);
  }
}