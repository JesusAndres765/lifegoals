import { Component } from '@angular/core';
import { MetaServiceService } from '../services/meta-service';
import { Meta } from '../models/meta.model';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {
  metas: Meta[] = [];
  newMeta: string = '';

  constructor(private metaService: MetaServiceService) {
    this.metaService.getMetas().subscribe(data => {
      this.metas = data;
    });
  }

  addMeta() {
    if (this.newMeta.trim() !== '') {
      this.metaService.addMeta({ meta: this.newMeta });
      this.newMeta = '';
    }
  }

  deleteMeta(id: string) {
    this.metaService.deleteMeta(id);
  }
}