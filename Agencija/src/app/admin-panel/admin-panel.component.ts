import { Component, OnInit } from '@angular/core';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { CoreService } from '../../core/core.service';

@Component({
  selector: 'app-admin-panel',
  templateUrl: './admin-panel.component.html',
  styleUrls: ['./admin-panel.component.scss'],
  animations: [
    trigger('expand', [
      state('collapsed', style({ height: '65px' })),
      state('expanded', style({ height: '380px' })),
      transition('collapsed <=> expanded', [animate('0.3s')])
    ])
  ]
})
export class AdminPanelComponent implements OnInit {

  offers: any;
  pageNo = 0;
  expand = [];
  constructor(protected coreService: CoreService) {}

  ngOnInit() {
    this.getOffers();
  }

  getOffers() {
    this.coreService.getOffersByPage(this.pageNo, 15).subscribe(
      data => {
        this.offers = data;
        for (let i = 0; i < this.offers.length; i++) {
          this.expand[i] = false;
        }
      },
      error => { console.log(error.message); }
    );
  }

  expandForm(j) {
    for (let i = 0; i < this.offers.length; i++) {
      this.expand[i] = i === j;
    }
  }

  delete(j) {
    this.coreService.deleteOffer(this.offers[j].id).subscribe(data => {
      this.offers = data;
      this.expand = [];
      for (let i = 0; i < this.offers.length; i++) {
        this.expand[i] = false;
      }
    }, error => { console.log(error.message); });
  }
}
