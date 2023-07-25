using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/order-controls'
service AppBackofficeOrderControlsService {
    entity OrderControls as projection on db.OrderControls;
}
